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
///File Name: base_decoration
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 13/07/23
///

import 'package:flutter/material.dart';

/// [DecorationC] has the common decoration which are
/// being used referentially.
class DecorationC {
  /// The default border radius to be used across the application.
  static const double defaultBr = 10.0;

  /// To give border radius to top or bottom.
  static BorderRadius brTopOrBottom(double? radius, {bool isTop = true}) {
    return BorderRadius.only(
      topLeft: isTop ? Radius.circular(radius ?? defaultBr) : Radius.zero,
      topRight: isTop ? Radius.circular(radius ?? defaultBr) : Radius.zero,
      bottomLeft: !isTop ? Radius.circular(radius ?? defaultBr) : Radius.zero,
      bottomRight: !isTop ? Radius.circular(radius ?? defaultBr) : Radius.zero,
    );
  }
}
