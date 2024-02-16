import 'package:dio/dio.dart';

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
///File Name: home_provider
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 16/02/24
///

/// [HomeProvider] downloads csv and zip files according to the link
/// with the help of [fetchData] function.
class HomeProvider {
  // Will download the csv and zip files according to the link given.
  static Future<Response> fetchData({
    required String url,
    required Dio dio,
    required bool isZip,
  }) async {
    return await dio.get(
      url,
      // Requesting data as List of integer.
      options: isZip
          ? Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (s) => (s ?? 0) < 500)
          : null,
    );
  }
}
