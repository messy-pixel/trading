// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tempt/models/models.dart';
import 'package:tempt/utils/utils.dart';
import 'package:archive/archive.dart';
import '../../../consts/consts.dart';
import '../../../consts/date_time_consts.dart';
import '../../../consts/string_consts.dart';

///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2024] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: fetch_data_cubit
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 17/01/24
///

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitialState());

  /// Global dio instance for making api calls and
  /// fetching the data.
  final Dio dio = Dio();

  /// Global list of data and link2FileDate
  /// to make comparison with the timestamps
  List<FinalDataModel> localData = [];
  String link2FileDate = '';

  /// Checks whats the last date of the data available in the
  /// local database and need to fetch new data or not.
  Future<void> logic() async {
    emit(LoadingData());
    DateTime lastDate;
    final List<FinalDataModel> finalDS = [];

    // retrieving the data from local database.
    localData = await _getLocalData();

    // If local database is empty
    if (localData.isEmpty) {
      // Setting lastDate as 1st of january 2024.
      lastDate = DateTimeC.formatToDate('01JAN2024');
    } else {
      // Getting the last date till that local database have data.
      lastDate = DateTimeC.formatToDate(localData.last.timestamp);
    }

    // No of days data need to fetch data.
    int days = DateTime.now().difference(lastDate).inDays;
    for (int i = 0; i < days; i++) {
      final DateTime date = lastDate.add(i.days);

      // Generating links.
      final List<String> links = _generateLinks(date);

      // Fetching data from the links and converting them in their
      // respective data models.
      final List<List<dynamic>> dataSets = await _fetchFileData(links);

      // If all the data is empty means some error occurred
      // than skipping that day.
      if (dataSets[0].isEmpty && dataSets[1].isEmpty && dataSets[2].isEmpty) {
        continue;
      }

      // Producing the final data from the all three of the datasets.
      finalDS.addAll(_produceFinalDataSet(
        dataSets[0] as List<ModelOne>,
        dataSets[1] as List<ModelTwo>,
        dataSets[2] as List<ModelThree>,
      ));
    }
    // Saving the data in the local database.
    _saveDataLocally(finalDS);

    // Refreshing the local data.
    localData = await _getLocalData();

    emit(FinalDataState(finalDataSet: localData));
  }

  /// To retrieve the data from the local database.
  Future<List<FinalDataModel>> _getLocalData() async {
    final List<Map<String, dynamic>> data =
        await AppSingleton().sqLite.select(tableName: DbConsts.finalDataSet);

    return data
        .map<FinalDataModel>((e) => FinalDataModel().fromJson(e))
        .toList();
  }

  /// Generates the links to download the files
  /// as per the given date.
  List<String> _generateLinks(DateTime date) {
    // Formatting the date as "ddMMyyyy" for link 1 and 3
    String formattedDate13 = DateFormat('ddMMyyyy').format(date);

    // Formatting the date as "ddMMMyyyy" for link 2
    String formattedDate2 = DateFormat('ddMMMyyyy').format(date).toUpperCase();
    final String month = DateFormat('MMM').format(date).toUpperCase();
    final String year = DateFormat('yyyy').format(date);

    String l1 = AppC.link1.replaceAll('\$', formattedDate13);

    String l2 = AppC.link2.replaceAll('\$', formattedDate13);

    String l3 = AppC.link3.replaceAll('!', year);
    l3 = l3.replaceAll('@', month);
    l3 = l3.replaceAll('\$', formattedDate2);
    String l3Name = AppC.file3name.replaceAll('\$', formattedDate2);
    link2FileDate = formattedDate2;

    return [l1, l2, l3, l3Name];
  }

  /// Downloads the filesData from the given links.
  Future<List<List<dynamic>>> _fetchFileData(List<String> links) async {
    final List<ModelOne> dataSet1 = [];
    final List<ModelTwo> dataSet2 = [];
    final List<ModelThree> dataSet3 = [];
    try {
      for (int i = 0; i < 3; i++) {
        // Fetching the data.
        Response res = await dio.get(
          links[i],
          // Requesting data as List of integer.
          options: i == 2
              ? Options(
                  responseType: ResponseType.bytes,
                  followRedirects: false,
                  validateStatus: (s) => (s ?? 0) < 500)
              : null,
        );

        if (i == 0) {
          dataSet1.addAll(
              await _convertCsvDataToDms(csvData: res.data, t: ModelOne()));
        } else if (i == 1) {
          dataSet2.addAll(
              await _convertCsvDataToDms(csvData: res.data, t: ModelTwo()));
        } else {
          // Extract zip contents.
          final Archive archive = ZipDecoder().decodeBytes(res.data);
          // Finding the csv file within the zip archive.
          final ArchiveFile? archiveFile = archive.findFile(links[3]);
          // Save the csv file locally.
          dataSet3.addAll(await _convertCsvDataToDms<ModelThree>(
              csvData: String.fromCharCodes(archiveFile?.content),
              t: ModelThree()));
        }
      }
      return [dataSet1, dataSet2, dataSet3];
    } catch (e) {
      // Returning empty lists if some error occured.
      return [[], [], []];
    }
  }

  /// Produces the final data set from the data
  /// fetched from the files.
  List<FinalDataModel> _produceFinalDataSet(
    List<ModelOne> dataSet1,
    List<ModelTwo> dataSet2,
    List<ModelThree> dataSet3,
  ) {
    List<FinalDataModel> finalDataSet = [];
    // region Calculations on the data retrieved from the file 3.
    final Map<String, List<ModelThree>> future = {};
    final Map<String, List<ModelThree>> options = {};

    for (final ModelThree e in dataSet3) {
      if (e.instrument == 'FUTSTK') {
        future.putIfAbsent(e.symbol ?? StringC.emptyString, () => []).add(e);
      } else if (e.instrument == 'OPTSTK') {
        options.putIfAbsent(e.symbol ?? StringC.emptyString, () => []).add(e);
      }
    }

    // operations on entries having instruments as future stocks.
    future.forEach((s, d) {
      double totalOpenInt = 0;
      double totalChgInOI = 0;

      for (final ModelThree e in d) {
        totalOpenInt += double.parse(e.openint ?? '0');
        totalChgInOI += double.parse(e.chgin01 ?? '0');
      }

      finalDataSet.add(FinalDataModel(
        symbol: s,
        instrument: d.first.instrument,
        timestamp: d.first.timestamp?.replaceAll('-', ''),
        openInterest: totalOpenInt.toDouble(),
        changeInOpenInterest: totalChgInOI.toDouble(),
      ));
    });

    // operations on entries having instruments as options stocks.
    options.forEach((s, d) {
      double ceTotalOI = 0;
      double ceTotalCOI = 0;
      double peTotalOI = 0;
      double peTotalCOI = 0;
      for (final ModelThree e in d) {
        if (e.optionTyp == 'CE') {
          ceTotalOI += int.parse(e.openint ?? '0');
          ceTotalCOI += int.parse(e.chgin01 ?? '0');
        } else if (e.optionTyp == 'PE') {
          peTotalOI += int.parse(e.openint ?? '0');
          peTotalCOI += int.parse(e.chgin01 ?? '0');
        }
      }

      finalDataSet.firstWhere((e) => e.symbol == s)
        ..ceOISet = ceTotalOI / 100000
        ..ceCIOISet = ceTotalCOI / 100000
        ..peOISet = peTotalOI / 100000
        ..peCIOISet = peTotalCOI / 100000;
    });

    for (FinalDataModel e in finalDataSet) {
      List<ModelThree> ceList = dataSet3
          .where((ele) => ele.optionTyp == 'CE' && ele.symbol == e.symbol)
          .toList();
      List<ModelThree> peList = dataSet3
          .where((ele) => ele.optionTyp == 'PE' && ele.symbol == e.symbol)
          .toList();

      ceList
          .sort((a, b) => a.openint.toDouble().compareTo(b.openint.toDouble()));
      ceList
          .sort((a, b) => a.openint.toDouble().compareTo(b.openint.toDouble()));

      e
        ..support1Set =
            peList.length > 1 ? peList.first.strikePr.toDouble() : null
        ..support2Set = peList.length > 2 ? peList[1].strikePr.toDouble() : null
        ..resistance1Set =
            ceList.length > 2 ? ceList.first.strikePr.toDouble() : null
        ..resistance2Set =
            ceList.length > 2 ? ceList[1].strikePr.toDouble() : null;

      // endregion

      // region Calculations on the data retrieved from the file 2.
      final two = dataSet2.firstWhere(
          (ele) => ele.symbol == e.symbol && e.timestamp == link2FileDate);
      e
        ..fiftyTwoWeekHighSet = two.adjusted52WeekHigh.toDouble()
        ..fiftyTwoWeekLowSet = two.adjusted52WeekLow.toDouble();

      // endregion

      // region Calculations on the data retrieved from the file 1.
      final ModelOne one = dataSet1.firstWhere((ele) =>
          ele.symbol == e.symbol &&
          ele.date?.replaceAll('-', '').toUpperCase() == e.timestamp);
      e
        ..previousCloseSet = one.pervClose.toDouble()
        ..openPriceSet = one.openPrice.toDouble()
        ..highPriceSet = one.highPrice.toDouble()
        ..lowPriceSet = one.lowPrice.toDouble()
        ..averagePriceSet = one.avgPrice.toDouble()
        ..ttlTrdQtySet = one.ttlTrdQty.toDouble()
        ..deliveryQuantitySet = one.delQty.toDouble()
        ..closePriceSet = one.closePrice.toDouble();

      // endregion

      // region Calculations for additional fields.
      final List<FinalDataModel> list =
          finalDataSet.where((element) => element.symbol == e.symbol).toList();

      list.sort((a, b) => a.timestamp.compareAsDate(b.timestamp));
      final int thisEIndex =
          list.indexWhere((element) => element.symbol == e.symbol);
      final List<FinalDataModel> range = [];
      double aveTTQ = 0;
      double aveDQ = 0;
      if (thisEIndex - 5 > 0) {
        range.addAll(list.getRange(thisEIndex - 5, thisEIndex));
      } else if (thisEIndex - 4 > 0) {
        range.addAll(list.getRange(thisEIndex - 4, thisEIndex));
      } else if (thisEIndex - 3 > 0) {
        range.addAll(list.getRange(thisEIndex - 3, thisEIndex));
      } else if (thisEIndex - 2 > 0) {
        range.addAll(list.getRange(thisEIndex - 2, thisEIndex));
      } else if (thisEIndex - 1 > 0) {
        range.addAll(list.getRange(thisEIndex - 1, thisEIndex));
      } else {
        aveTTQ = 1;
        aveDQ = 1;
      }
      aveTTQ = range.map((e) => e.ttlTrdQty).toList().average;
      aveDQ = range.map((e) => e.deliveryQuantity).toList().average;
      e
        ..futureOIPerSet = e.changeInOpenInterest.divide(e.openInterest)
        ..pricePerSet = e.closePrice.divide(e.previousClose)
        ..pCRSet = e.peOI.divide(e.ceOI)
        ..c2SupportSet = e.support1.divide(e.closePrice) * 100
        ..c2ResistanceSet = e.closePrice.divide(e.resistance1) * 100
        ..c2HighSet = e.closePrice.divide(e.fiftyTwoWeekHigh) * 100
        ..c2LowSet = e.fiftyTwoWeekLow.divide(e.closePrice) * 100
        ..volumeFactorSet = e.ttlTrdQty.divide(aveTTQ)
        ..deliveryFactorSet = e.deliveryFactor.divide(aveDQ);
      // endregion
    }

    return finalDataSet;
  }

  /// Saves the data in the local database.
  Future<void> _saveDataLocally(List<FinalDataModel> datasets) async {
    for (final FinalDataModel e in datasets) {
      AppSingleton().sqLite.insert(tableName: DbConsts.finalDataSet, data: e);
    }
  }

  /// Converts the csv data fetched from the severs to the
  /// consecutive data models.
  Future<List<T>> _convertCsvDataToDms<T extends CsvConvertible>(
      {required String csvData, required T t}) async {
    List<String> data = [];

    data = csvData
        .replaceAll('"', '')
        .replaceAll('\n', t is ModelThree ? '' : ',')
        .split(',')
        .toList();

    // Skipping the leading five values if model is ModelTwo.
    if (t is ModelTwo) data.removeRange(0, 4);

    final List<T> dms = [];

    // No of parameter in the model.
    final int n = t.noOfParameters();

    for (int i = n; i < data.length && (i + n) < data.length; i += n) {
      dms.add(t.fromCsv(data.sublist(i, i + n)));
    }

    return dms;
  }

  /// Deletes the Zip file from local storage.
// Future<void> _deleteZipFile() async {
//   try {
//     // Get the document directory.
//     Directory dir = await getApplicationCacheDirectory();
//     String path = dir.path;
//
//     // Delete the zip file.
//     File zipFile = File('$path/zip_file.zip');
//     if (await zipFile.exists()) {
//       await zipFile.delete();
//       debugPrint('Deleted the zip.');
//     }
//   } catch (e) {
//     debugPrint('Error deleting the zip file.');
//   }
// }
}
