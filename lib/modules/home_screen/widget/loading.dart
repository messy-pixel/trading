import 'package:flutter/material.dart';
import 'package:tempt/utils/utils.dart';

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
///File Name: loading
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 12/01/24
///

class LoadingW extends StatelessWidget {
  const LoadingW({super.key, required this.lEnum});

  final LoadingEnum lEnum;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(color: lEnum.color),
        16.sizedHeightBox,
        Text(lEnum.text, style: context.textTheme.labelLarge),
      ],
    ).parentWidth;
  }
}

enum LoadingEnum {
  generatingLinks(
    color: Colors.blueAccent,
    text: 'Generating links to download files...',
  ),
  downloadingFiles(
    color: Colors.orangeAccent,
    text: 'Downloading Files...',
  ),
  retrievingFileData(
    color: Colors.purpleAccent,
    text: 'Retrieving data from the files...',
  ),
  savingDataLocally(
    color: Colors.deepOrange,
    text: 'Saving Data locally...',
  ),
  retrievingLocalData(
    color: Colors.amberAccent,
    text: 'Retrieving data from local db...',
  ),
  loadingData(
    color: Colors.blueAccent,
    text: 'Loading...',
  );

  final String text;
  final Color color;

  const LoadingEnum({required this.text, required this.color});
}
