import 'package:flutter/cupertino.dart';
import 'package:tempt/consts/consts.dart';
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
///File Name: base_error
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 17/01/24
///

enum ErrorTypes {
  noDataFound(text: 'No Data Found');

  const ErrorTypes({required this.text});

  final String text;
}

class BaseError extends StatelessWidget {
  const BaseError({super.key, required this.errorType});

  final ErrorTypes errorType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetC.error, scale: 10),
        16.sizedHeightBox,
        Text(
          errorType.text,
          textAlign: TextAlign.center,
          style: context.textTheme.titleMedium,
        ),
        16.sizedHeightBox,
      ],
    ).fadeIn().expand();
  }
}
