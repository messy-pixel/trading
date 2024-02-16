///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2023] Meditab Software Inc.
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
///File Name: base_popup
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 26/07/23
///

import 'package:flutter/material.dart';
import 'package:tempt/utils/utils.dart';
import 'package:tempt/utils/widget_exntesion.dart';

import 'base_bottomsheet.dart';


/// [BasePopUp] handle the popUps.
/// It have the method [openDialogBottomSheetAccordingly]
/// which check if the device the application running on
/// is Mobile or tablet and opens a [Dialog] for the [Tablet] Devices.
/// and a [BottomSheet] for the [Mobile] Devices.
///
class BasePopup {
  static void openDialogBottomSheetAccordingly(
      {required BuildContext context,
      required String title,
      required Widget child,
      Widget? button,
      double? width,
      bool zeroPadding = false,
      bool showSheetTitle = true,
      required bool showCloseButton}) {
    // Mobile Device so opening a [BottomSheet].
    BaseSheet.sheet(
        context: context,
        title: showSheetTitle
            ? Text(title,
                    style: context.textTheme.titleMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold))
                .paddingHorizontal16()
            : const SizedBox.shrink(),
        content: child,
        button: button);
  }
}
