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
///File Name: base_snackbar
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 10/07/23
///

import 'package:flutter/material.dart';

/// [BaseSnackBar] to show a snackBar.
///
class BaseSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          {required BuildContext context,
          required String message,
          Color? backgroundColor}) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor ?? Colors.black,
          content: Text(
            message,
            overflow: TextOverflow.visible,
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
}
