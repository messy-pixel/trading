import 'package:flutter/material.dart';
import 'package:tempt/utils/utils.dart';
import 'package:tempt/utils/widget_exntesion.dart';

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
///File Name: base_bottomsheet
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 25/07/23
///

/// [BaseSheet] Consists of a method [sheet] that pushed a base bottom-sheet
/// for the mobile devices.
///
class BaseSheet {
  static void sheet({
    required BuildContext context,
    required Widget title,
    required Widget content,
    required Widget? button,
  }) {
    showModalBottomSheet(
      context: context,
      // draggable.
      enableDrag: true,

      // drag handle is visible.
      showDragHandle: true,

      // scroll is controlled.
      isScrollControlled: true,

      // background color is snow white.
      backgroundColor: context.colorScheme.background,

      // sheet constraints.
      constraints: const BoxConstraints(minWidth: double.maxFinite),

      // rounded shape from top left and right side.
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),

      // context builder.
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [title, content, if (button != null) button],
        ).paddingBottom(16),
      ),
    );
  }
}
