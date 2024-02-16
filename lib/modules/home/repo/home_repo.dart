import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:tempt/modules/home/cubit/home_cubit.dart';
import 'package:tempt/modules/home/provider/home_provider.dart';

import '../../../models/models.dart';

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
///File Name: home_repo
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 16/02/24
///

/// [HomeRepo] has an function [fetchData]
/// that download the csv and zip files from the servers
/// with the help of [HomeProvider].
/// Convert them in the respective data models
/// And pass them to the [FetchDataCubit].
class HomeRepo {
  // Static instance of the dio to make api calls.
  static final Dio dio = Dio();

  // [fetchData] downloads csv and zip files according to the links
  // And convert them into their respective data models.
  static Future<List<List<dynamic>>> fetchData({
    required List<String> links,
  }) async {
    final List<ModelOne> dataSet1 = [];
    final List<ModelTwo> dataSet2 = [];
    final List<ModelThree> dataSet3 = [];
    try {
      for (int i = 0; i < 3; i++) {
        // Fetching the data.
        Response res = await HomeProvider.fetchData(
            url: links[i], dio: dio, isZip: i == 2);

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

  /// Converts the csv data fetched from the severs to the
  /// consecutive data models.
  static Future<List<T>> _convertCsvDataToDms<T extends CsvConvertible>(
      {required String csvData, required T t}) async {
    List<String> data = [];

    // Replacing newline(\n) and inverted commas with empty and comma
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
}
