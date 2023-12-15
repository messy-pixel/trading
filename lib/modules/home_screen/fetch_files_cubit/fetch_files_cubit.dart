import 'dart:io';

import 'package:archive/archive.dart';
import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../../consts/consts.dart';
import '../../../models/models.dart';

part 'fetch_files_state.dart';

class FetchFilesCubit extends Cubit<FetchFilesState> {
  FetchFilesCubit() : super(FetchFilesInitial());

  final Dio dio = Dio();

  /// Generates links with today's date.
  void generateLinks() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date as "ddMMyyyy" for link 1 and 3
    String formattedDate13 = DateFormat('ddMMyyyy').format(now);

    // Format the date as "ddMMMyyyy" for link 2
    String formattedDate2 = DateFormat('ddMMMyyyy').format(now);
    final String month = DateFormat('MMM').format(now);
    final String year = DateFormat('yyyy').format(now);

    String l1 = AppC.link1.replaceAll('\$', formattedDate13);

    String l2 = AppC.link2.replaceAll('!', year);
    l2 = l2.replaceAll('@', month);
    l2 = l2.replaceAll('\$', formattedDate2.toUpperCase());

    String l3 = AppC.link3.replaceAll('\$', formattedDate13);

    emit(GeneratedLinks(links: [l1, l2, l3]));
    // fetchFiles(links: [l1, l2, l3]);
  }

  Future<void> downloadCsv(List<String> links) async {
    final Dio dio = Dio();

    // Download the file.
    Response res = await dio.get(
      links.first,
      // Requesting data as List of integer.
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (s) => (s ?? 0) < 500),
    );

    File csv = await saveCsvLocally(res.data);

    final v = await readCsvFile<ModelOne>(file: csv, t: ModelOne());
  }

  Future<List<T>> readCsvFile<T extends CsvConvertible>(
      {required File file, required T t}) async {
    final String csvData = await file.readAsString();
    final List<List<String>> rowAsDoublyList =
        const CsvToListConverter().convert(csvData, shouldParseNumbers: false);
    final List<String> data = splitValuesWithNewLine(rowAsDoublyList);

    if (t is ModelTwo) data.removeRange(0, 2);
    final List<T> dms = [];
    final int n = t.noOfParameters();

    for (int i = n; i < data.length && i + (n - 1) < data.length; i += n) {
      dms.add(t.fromCsv(data.sublist(i, i + n)));
    }

    return dms;
  }

  /// Splits the values have the new line character.
  List<String> splitValuesWithNewLine(List<List<String>> input) {
    List<List<String>> result = [];

    for (final row in input) {
      List<String> updatedRow = [];
      for (final cell in row) {
        // Split the cell content by \n and add each part to the updated row.
        updatedRow.addAll(cell.split('\n'));
      }
      result.add(updatedRow);
    }
    return result.first;
  }

  // Saves the csv file locally in the application doc directory.
  Future<File> saveCsvLocally(List<int> data) async {
    // Get the document directory.
    Directory dir = await getApplicationCacheDirectory();
    String path = dir.path;

    // Save the csv file locally.
    File localFileCsv = File('$path/file.csv');
    localFileCsv.writeAsBytesSync(data);
    return localFileCsv;
  }

  /// Download Zip and get csv from it.
  Future<void> downloadZipAndGetCsv(String link) async {
    final Response res = await dio.get(link);

    final Directory dir = await getApplicationCacheDirectory();

    // Extract zip content.
    List<int> bytes = res.data;
    Archive arc = ZipDecoder().decodeBytes(bytes);
    // Find the csv file within the zip archive.
    ArchiveFile? csvFile = arc.findFile('file.csv');

    if (csvFile != null) {
      // Read csv content directly

      // final File file = await saveCsvLocally(csv.);
    } else {
      debugPrint('Csv file is not available in the zip.');
    }
  }

  /// Deletes the Zip file from local storage.
  Future<void> deleteZipFile() async {
    try {
      // Get the document directory.
      Directory dir = await getApplicationCacheDirectory();
      String path = dir.path;

      // Delete the zip file.
      File zipFile = File('$path/zip_file.zip');
      if (await zipFile.exists()) {
        await zipFile.delete();
        debugPrint('Deleted the zip.');
      }
    } catch (e) {
      debugPrint('Error deleting the zip file.');
    }
  }
}
