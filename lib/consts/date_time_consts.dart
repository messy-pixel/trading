/// Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2023] Meditab Software Inc.
/// All Rights Reserved.
///
/// NOTICE:  All information contained herein is, and remains
/// the property of Meditab Software Inc. and its suppliers,
/// if any.  The intellectual and technical concepts contained
/// herein are proprietary to Meditab Software Incorporated
/// and its suppliers and may be covered by U.S. and Foreign Patents,
/// patents in process, and are protected by trade secret or copyright law.
/// Dissemination of this information or reproduction of this material
/// is strictly forbidden unless prior written permission is obtained
/// from Meditab Software Incorporated.
///
/// File Name: date_time_constants
///
/// @author Adarsh Sudarsanan (adarshs@meditab.com) Meditab Software Inc.
/// @version 1.0.0
/// @since 22/05/23
///
// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:tempt/utils/utils.dart';

class DateTimeC {
  static DateTime formatToDate(String? date) {
    final String cap = date?.substring(2, 5).capFirstLetter ?? '';

    return DateFormat('ddMMMyyyy')
        .parse(date?.replaceAll(cap.toUpperCase(), cap) ?? '');
  }

  static String formatFromStr(String? date) {
    final String cap = date?.substring(2, 5).capFirstLetter ?? '';

    return DateFormat('ddMMMyyyy')
        .format(DateFormat('ddMMMyyyy')
            .parse(date?.replaceAll(cap.toUpperCase(), cap) ?? ''))
        .toUpperCase();
  }

  static String formatFromDate(DateTime date) =>
      DateFormat('ddMMMyyyy').format(date).toUpperCase();

  static String dateMonthDay(DateTime date) =>
      DateFormat('d EEEE MMM, yyyy').format(date);

  static String dayDateMonth(DateTime date) =>
      DateFormat('EEEE,d MMMM').format(date);

  /// Duration constants.
  static Duration get ms500 => const Duration(milliseconds: 500);

  static Duration get ms300 => const Duration(milliseconds: 300);

  static Duration get ms200 => const Duration(milliseconds: 200);

  static Duration get ms400 => const Duration(milliseconds: 400);

  static Duration get ms800 => const Duration(milliseconds: 800);

  static Duration get sec1 => const Duration(seconds: 1);

  static Duration get sec2 => const Duration(seconds: 2);

  static Duration get sec3 => const Duration(seconds: 3);

  static Duration get sec5 => const Duration(seconds: 5);

  static Duration get sec6 => const Duration(seconds: 6);

  static Duration get sec10 => const Duration(seconds: 10);

  static Duration get min5 => const Duration(minutes: 5);

  static Duration get min1 => const Duration(minutes: 1);

  static DateTime stringToDayTime(String dateString) =>
      DateTime.parse(dateString);
}
