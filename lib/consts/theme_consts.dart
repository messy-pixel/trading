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
///File Name: theme_consts
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/07/23
///

import 'package:flutter/material.dart';
import 'package:flutter_common_utils/constant/size_constant.dart';
import 'package:tempt/consts/consts.dart';

import 'border_radius_consts.dart';
import 'color_consts.dart';
import 'decoration_consts.dart';

/// [ThemeConsts] has the list of constants for [ThemeData]
/// of different widgets and [ApplicationLayouts].
/// It have [themeColorScheme], [TextTheme], [InputDecorationTheme],
/// [ButtonTheme], [floatingActionButtonTheme] etc..
///
class ThemeC {
  /// The lightTheme.
  static final lightTheme = ThemeData(
    // Material theme
    useMaterial3: true,

    // Background color.
    scaffoldBackgroundColor: ColorConsts.greyWhite,

    // AppbarTheme.
    appBarTheme: appbarTheme,

    // The font family.
    fontFamily: 'Inter',

    // The color scheme.
    colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        // Used in elevated buttons.
        primary: ColorConsts.primary,
        // Used in text on elevated buttons.
        onPrimary: ColorConsts.snow,
        // Used in light elevated button.
        secondary: ColorConsts.primary,
        // Used in text on light elevated button.
        onSecondary: ColorConsts.primary,
        // Used in error snackBar.
        error: ColorConsts.red,
        background: ColorConsts.greyWhite,
        surface: ColorConsts.snow,
        surfaceVariant: ColorConsts.greyWhite,

        // Used in text of the card.
        onSurface: ColorConsts.darkGrey,
        shadow: ColorConsts.lightGrey,
        outline: ColorConsts.greyWhite,
        inverseSurface: ColorConsts.black,
        surfaceTint: ColorConsts.transparent),

    // Text constants.
    textTheme: textThemeLight,

    // Text field input decoration
    inputDecorationTheme: inputDecorationThemeLight,

    // Button theme
    buttonTheme: buttonThemeLight,

    // Floating action button theme
    floatingActionButtonTheme: floatingActionButtonThemeLight,

    // Check box theme
    checkboxTheme: checkBoxTheme,

    // Card theme
    cardTheme: cardTheme,

    // Tab bar theme
    tabBarTheme: tabBarTheme,

    // ExpansionTileTheme
    expansionTileTheme: expansionTileTheme,

    // ElevatedButtonTheme
    elevatedButtonTheme: elevatedButtonTheme,

    // OutlinedButtonTheme
    outlinedButtonTheme: outlinedButtonTheme,
  );

  /// region Light theme constants
  // AppBar theme constant
  static final AppBarTheme appbarTheme = AppBarTheme(
    surfaceTintColor: ColorConsts.snow,
    backgroundColor: ColorConsts.snow,
    centerTitle: false,
    elevation: 1,
    titleSpacing: 12,
    iconTheme: const IconThemeData(color: ColorConsts.greyWhite),
    shadowColor: ColorConsts.greyWhite,
    titleTextStyle: const TextStyle(
        fontFamily: "Merriweather",
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColorConsts.black),
    shape: RoundedRectangleBorder(
      borderRadius: DecorationC.brTopOrBottom(12.0, isTop: false),
    ),
  );

  // Text theme constant
  static final TextTheme textThemeLight = TextTheme(
      displayLarge: const TextStyle(
        color: ColorConsts.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w800,
      ),
      titleLarge: const TextStyle(
        fontFamily: "Merriweather",
        color: ColorConsts.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: const TextStyle(
        color: ColorConsts.black,
        fontSize: 18.0,
      ),
      displaySmall: const TextStyle(
        color: ColorConsts.greyWhite,
        fontSize: 20.0,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: const TextStyle(color: ColorConsts.black, fontSize: 18.0),
      bodyMedium: const TextStyle(
        color: ColorConsts.black,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
      bodySmall:
          TextStyle(color: ColorConsts.darkGrey.withOpacity(0.8), fontSize: 12),
      labelMedium: TextStyle(
        color: ColorConsts.black.withOpacity(0.8),
      ),
      labelLarge: const TextStyle(color: ColorConsts.black));

  // TextField Input decoration theme constant
  static final InputDecorationTheme inputDecorationThemeLight =
      InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    filled: true,
    fillColor: ColorConsts.snow,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.darkRed, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: BorderSide(color: ColorConsts.darkRed.withOpacity(0.8)),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
  );

  // Button theme constant
  static final ButtonThemeData buttonThemeLight = ButtonThemeData(
      height: 40,
      disabledColor: ColorConsts.greyWhite.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          BorderConsts.borderRadius10,
        ),
      ));

  // FloatingActionButton Theme constant
  static final FloatingActionButtonThemeData floatingActionButtonThemeLight =
      FloatingActionButtonThemeData(
          extendedTextStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(BorderConsts.borderRadius10)),
          elevation: SizeC.size8,
          backgroundColor: ColorConsts.primary);

  static final CheckboxThemeData checkBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.all(ColorConsts.greyWhite),
      fillColor: MaterialStateProperty.all(ColorConsts.snow));

  static CardTheme cardTheme = CardTheme(
    color: ColorConsts.snow,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    surfaceTintColor: Colors.transparent,
    margin: const EdgeInsets.all(0),
  );

  /// The TabBar theme.
  static TabBarTheme tabBarTheme = TabBarTheme(
    splashFactory: NoSplash.splashFactory,
    dividerColor: Colors.transparent,
    indicator: BoxDecoration(
        borderRadius: SizeConstant.borderRadius10,
        border: Border.all(color: const Color.fromRGBO(
            85, 139, 208, 0.2)),
        color: Colors.white),
    labelStyle: const TextStyle(
      fontSize: 16,
      color: Color.fromRGBO(85, 139, 208, 1),
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 16,
      color: Color(0xFF838383),
    ),
  );

  static ExpansionTileThemeData expansionTileTheme = ExpansionTileThemeData(
    iconColor: ColorConsts.primary,
    shape: RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    collapsedShape:
        RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    tilePadding: const EdgeInsets.symmetric(horizontal: 12),
    textColor: ColorConsts.black,
    // childrenPadding: const EdgeInsets.only(bottom: 12, right: 12, left: 12, ),
    collapsedBackgroundColor: ColorConsts.snow,
    backgroundColor: ColorConsts.snow,
  );

  /// The elevated button style.
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          PaddingConstant.vertical12),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConsts.primary,
      ),
      elevation: MaterialStateProperty.all<double>(0.0),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(ColorConsts.greyWhite),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  /// The outlined button.

  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          PaddingConstant.vertical12),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConsts.snow,
      ),
      elevation: MaterialStateProperty.all<double>(0.0),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.transparent),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorConsts.primary,
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
  );

  /// The filled button theme.
  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          PaddingConstant.vertical12),
      backgroundColor: MaterialStateProperty.all<Color>(
        ColorConsts.greyWhite,
      ),
      elevation: MaterialStateProperty.all<double>(0.0),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(color: Colors.transparent),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      foregroundColor: MaterialStateProperty.all<Color>(
        ColorConsts.primary,
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  /// endregion

  /// The dark theme.
  static final darkTheme = ThemeData(
    // The color scheme.
    colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        // Used in elevated buttons.
        primary: ColorConsts.primary,
        // Used in text on elevated buttons.
        onPrimary: ColorConsts.black,
        // Used in light elevated button.
        secondary: ColorConsts.primary,
        // Used in text on light elevated button.
        onSecondary: ColorConsts.primary,
        // Used in error snackBar.
        error: ColorConsts.red,
        background: ColorConsts.darkBackground,
        surface: ColorConsts.darkSurface,
        surfaceVariant: ColorConsts.darkGrey4,

        // Used in text of the card.
        onSurface: ColorConsts.darkGrey,
        shadow: ColorConsts.lightGrey,
        outline: ColorConsts.greyWhite,
        inverseSurface: ColorConsts.snow,
        surfaceTint: ColorConsts.transparent),

    // Material theme
    useMaterial3: true,

    // Background color.
    scaffoldBackgroundColor: ColorConsts.darkBackground,

    // AppbarTheme.
    appBarTheme: appbarThemeDark,

    // The font family.
    fontFamily: 'Inter',

    // Text constants.
    textTheme: textThemeDark,

    // Text field input decoration
    inputDecorationTheme: inputDecorationThemeDark,

    // Button theme
    buttonTheme: buttonThemeDark,

    // Floating action button theme
    floatingActionButtonTheme: floatingActionButtonThemeDark,

    // Check box theme.
    checkboxTheme: checkBoxTheme,

    // Card Theme
    cardTheme: cardThemeDark,

    // Tab bar theme
    tabBarTheme: tabBarTheme,

    // ExpansionTileTheme
    expansionTileTheme: expansionTileThemeDark,

    // ElevatedButtonTheme
    elevatedButtonTheme: elevatedButtonTheme,

    // OutlinedButtonTheme
    outlinedButtonTheme: outlinedButtonTheme,
  );

  /// region Dark theme constants

  // Text theme constant
  static final TextTheme textThemeDark = TextTheme(
    displayLarge: const TextStyle(
      color: ColorConsts.primary,
      fontSize: 28.0,
      fontWeight: FontWeight.w800,
    ),
    titleLarge: const TextStyle(
      fontFamily: "Merriweather",
      color: ColorConsts.snow,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: const TextStyle(
      color: ColorConsts.snow,
      fontSize: 18.0,
    ),
    displaySmall: const TextStyle(
      color: ColorConsts.snow,
      fontSize: 20.0,
      fontWeight: FontWeight.w800,
    ),
    bodyLarge: const TextStyle(color: ColorConsts.snow, fontSize: 18.0),
    bodyMedium: const TextStyle(
      color: ColorConsts.snow,
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: const TextStyle(color: ColorConsts.greyWhite, fontSize: 12),
    labelMedium: TextStyle(
      color: ColorConsts.snow.withOpacity(0.8),
    ),
    labelLarge: const TextStyle(color: ColorConsts.snow),
  );

  // TextField InputDecoration theme constant
  static final InputDecorationTheme inputDecorationThemeDark =
      InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.darkRed, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: BorderSide(color: ColorConsts.darkRed.withOpacity(0.8)),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(BorderConsts.borderRadius10),
      borderSide: const BorderSide(color: ColorConsts.transparent),
    ),
  );

  // Button theme constant
  static final ButtonThemeData buttonThemeDark = ButtonThemeData(
      height: 40,
      disabledColor: ColorConsts.greyWhite.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          BorderConsts.borderRadius10,
        ),
      ));

  // FloatingActionButton theme constant
  static final FloatingActionButtonThemeData floatingActionButtonThemeDark =
      FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderConsts.borderRadius10)),
    backgroundColor: ColorConsts.primary,
    elevation: SizeC.size8,
  );

  static CardTheme cardThemeDark = CardTheme(
    color: ColorConsts.darkSurface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    surfaceTintColor: Colors.transparent,
    margin: const EdgeInsets.all(0),
  );

  // AppBar theme constant
  static final AppBarTheme appbarThemeDark = AppBarTheme(
    surfaceTintColor: ColorConsts.darkSurface,
    backgroundColor: ColorConsts.darkSurface,
    centerTitle: false,
    elevation: 1,
    titleSpacing: 0,
    iconTheme: const IconThemeData(color: ColorConsts.greyWhite),
    shadowColor: ColorConsts.greyWhite,
    titleTextStyle: const TextStyle(
        fontFamily: "Merriweather",
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColorConsts.snow),
    shape: RoundedRectangleBorder(
      borderRadius: DecorationC.brTopOrBottom(12.0, isTop: false),
    ),
  );

  static ExpansionTileThemeData expansionTileThemeDark = ExpansionTileThemeData(
    iconColor: ColorConsts.primary,
    shape: RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    collapsedShape:
        RoundedRectangleBorder(borderRadius: SizeConstant.borderRadius8),
    tilePadding: const EdgeInsets.symmetric(horizontal: 12),
    textColor: ColorConsts.snow,
    // childrenPadding: const EdgeInsets.only(bottom: 12, right: 12, left: 12, ),
    collapsedBackgroundColor: ColorConsts.darkSurface,

    backgroundColor: ColorConsts.darkSurface,
  );

  /// endregion
}
