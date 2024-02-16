import 'package:flutter/cupertino.dart';

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
///File Name: border_radius_conts
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/07/23
///


/// [BorderConsts] has the list of constants for
/// [BorderRadius] to use trough out the application.

class BorderConsts {
  static const double borderRadius8 = 8.0;
  static const double borderRadius12 = 12.0;
  static const double borderRadius14 = 14.0;
  static const double borderRadius16 = 16.0;
  static const double borderRadius18 = 18.0;
  static const double borderRadius20 = 20.0;
  static const double borderRadius22 = 22.0;
  static const double borderRadius24 = 24.0;
  static const double borderRadius30 = 30.0;
  static const double borderRadius33 = 33.0;
  static const double borderRadius10 = 10.0;
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
