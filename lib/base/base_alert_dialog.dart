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
///File Name: base_alert_dialog
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 14/07/23
///

import 'package:flutter/material.dart';
import 'package:flutter_common_utils/constant/size_constant.dart';
import 'package:tempt/utils/utils.dart';
import 'package:tempt/utils/widget_exntesion.dart';

import '../consts/string_consts.dart';

/// [BaseAlertDialog] Consists of the common alert dialog.
/// it takes [title], [content], [leftButtonTitle], [onLeftButtonTap],
/// [rightButton], [isCloseIconVisible], [onCloseIconTap] and [zeroPadding]
///
class BaseAlertDialog extends StatelessWidget {
  const BaseAlertDialog(
      {super.key,
      this.customLeftButton,
      this.leftButtonTitle,
      this.onLeftButtonTap,
      required this.title,
      required this.content,
      required this.rightButton,
      this.isCloseIconVisible = false,
      this.zeroPadding = false,
      this.onCloseIconTap});

  final String title;
  final dynamic content;
  final String? leftButtonTitle;
  final VoidCallback? onLeftButtonTap;
  final VoidCallback? onCloseIconTap;
  final Widget rightButton;
  final bool isCloseIconVisible;
  final bool zeroPadding;
  final Widget? customLeftButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      titlePadding: EdgeInsets.zero,
      backgroundColor: context.colorScheme.background,
      shape: RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius12),
      actionsPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      contentPadding: zeroPadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 12),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: isCloseIconVisible
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title.
              Text(
                title,
                overflow: TextOverflow.visible,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
              ).expand(),

              // close icon if [isCloseIconVisible] is ture.
              if (isCloseIconVisible)
                IconButton(
                  onPressed: onCloseIconTap,
                  icon: const Icon(Icons.close),
                )
            ],
          ).paddingOnly(
              top: isCloseIconVisible ? 4 : 12,
              bottom: isCloseIconVisible ? 4 : 12,
              left: 20,
              right: isCloseIconVisible ? 8 : 20),
          // divider to distinguish the title and the content of the dialog.
          Container(
              height: 1, color: context.colorScheme.onSurface.withOpacity(0.1))
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              // custom left and right buttons if custom left buttons is no null.
              customLeftButton != null
                  ? [
                      // left button.
                      customLeftButton.expand(),
                      8.sizedWidthBox,

                      // right button.
                      rightButton.expand()
                    ]
                  // single button if the left button title is null.
                  : leftButtonTitle != null
                      // static left button with cusomt right button.
                      ? [
                          // negative button.
                          OutlinedButton(
                            onPressed: onLeftButtonTap,
                            child: Text(
                              leftButtonTitle ?? StringC.emptyString,
                              style: context.textTheme.titleMedium?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ).expand(),
                          8.sizedWidthBox,

                          // right button.
                          rightButton.expand()
                        ]
                      // single right button.
                      : [rightButton],
        ).paddingBottom(4),
      ],
      content:
          // content in the center in text widget if content is string.
          content is String
              ? Center(
                  child: Text(
                    content,
                    maxLines: 10,
                    style: context.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ).paddingAll(12),
                )
              // other wise context it self.
              : content,
    );
  }
}
