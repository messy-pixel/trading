import 'package:flutter/material.dart';

import '../consts/consts.dart';

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
///File Name: widget_exntesion
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 12/01/24
///

extension WidgetExp on Widget {
  /// To wrap the widget with the [Align] widget.
  Widget align({AlignmentGeometry? alignment}) {
    return Align(alignment: alignment ?? Alignment.center, child: this);
  }

  /// return custom padding from all side
  ///Ex: Text("Value of the counter is $value").paddingAll(8)
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  /// return custom symmetric padding from horizontal side
  ///Ex: Text("Value of the counter is $value").paddingHorizontal(8)
  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  /// return custom symmetric padding from vertical side
  ///Ex: Text("Value of the counter is $value").paddingVertical(8)
  Widget paddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  /// return custom symmetric padding from each side
  ///Ex: Text("Value of the counter is $value").paddingSymmetric(vertical: 8, horizontal:10)
  Widget paddingSymmetric(
          {required double vertical, required double horizontal}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  /// return custom padding from each side
  ///Ex: Text("Value of the counter is $value").paddingOnly(top: 8, left: 10)
  Padding paddingOnly({
    double top = 0.0,
    double left = 0.0,
    double bottom = 0.0,
    double right = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }

  /// return padding top
  ///Ex: Text("Value of the counter is $value").paddingTop(8)
  Widget paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  ///Ex: Text("Value of the counter is $value").paddingLeft(8)
  Widget paddingLeft(double left) {
    return Padding(padding: EdgeInsets.only(left: left), child: this);
  }

  /// return padding right
  ///Ex: Text("Value of the counter is $value").paddingRight(8)
  Widget paddingRight(double right) {
    return Padding(padding: EdgeInsets.only(right: right), child: this);
  }

  /// return padding bottom
  ///Ex: Text("Value of the counter is $value").paddingBottom(8)
  Widget paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  ///Padding with their constant paddings
  ///No required to put values in it
  ///Ex: Text("Value of the counter is $value").paddingAllDefault()

  Widget paddingAll4() => Padding(
        padding: PaddingConstant.default4,
        child: this,
      );

  Widget paddingAllDefault() => Padding(
        padding: PaddingConstant.default8,
        child: this,
      );

  Widget paddingAll16() => Padding(
        padding: PaddingConstant.default16,
        child: this,
      );

  Widget paddingAll24() => Padding(
        padding: PaddingConstant.default24,
        child: this,
      );

  Widget paddingAll2() => Padding(
        padding: PaddingConstant.default2,
        child: this,
      );

  Widget paddingHorizontal8() => Padding(
        padding: PaddingConstant.horizontal8,
        child: this,
      );

  Widget paddingHorizontal12() => Padding(
        padding: PaddingConstant.horizontal12,
        child: this,
      );

  Widget paddingHorizontal16() => Padding(
        padding: PaddingConstant.horizontal16,
        child: this,
      );

  Widget paddingVertical8() => Padding(
        padding: PaddingConstant.vertical8,
        child: this,
      );

  Widget paddingVertical12() => Padding(
        padding: PaddingConstant.vertical12,
        child: this,
      );

  Widget paddingVertical16() => Padding(
        padding: PaddingConstant.vertical16,
        child: this,
      );

  Widget paddingUpSide412() => Padding(
        padding: PaddingConstant.up4side12,
        child: this,
      );

  Widget paddingUpSide812() => Padding(
        padding: PaddingConstant.up8side12,
        child: this,
      );

  Widget paddingUpSide124() => Padding(
        padding: PaddingConstant.up12side4,
        child: this,
      );

  Widget paddingUpSide128() => Padding(
        padding: PaddingConstant.up12side8,
        child: this,
      );

  Widget positioned({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) =>
      Positioned(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: this,
      );
}
