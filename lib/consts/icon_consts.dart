import 'package:flutter/material.dart';
import 'package:tempt/utils/utils.dart';

/// [IconConsts] has the list of icons to be used through
/// out the application.
class IconConsts {
  static const IconData closecircle = Icons.cancel;
  static const IconData checkCircle = Icons.check_circle;
  static const IconData removeCircle = Icons.remove_circle_sharp;
  static const IconData refresh = Icons.refresh;
  static const IconData sync = Icons.sync;
  static const IconData settings = Icons.settings;
  static const IconData logout = Icons.power_settings_new;
  static const IconData clear = Icons.clear;
  static const IconData visibility = Icons.visibility;
  static const IconData visibilityOff = Icons.visibility_off;
  static const IconData keyboardArrowDown = Icons.keyboard_arrow_down;
  static const IconData search = Icons.search;
  static const IconData directions = Icons.directions;
  static const IconData person = Icons.person_outline_rounded;
  static const IconData lock = Icons.lock_outline_rounded;
  static const IconData locationIcon = Icons.location_on;
  static const IconData arrowPrevious = Icons.arrow_back_ios;
  static const IconData arrowNext = Icons.arrow_forward_ios_rounded;
  static const IconData note = Icons.sticky_note_2_outlined;
  static const IconData warning = Icons.warning_rounded;
  static const IconData fingerPrint = Icons.fingerprint;
  static const IconData check = Icons.check;
  static const IconData checkAll = Icons.done_all;
  static const IconData phone = Icons.phone;
  static const IconData money = Icons.attach_money;
  static const IconData leftArrow = Icons.chevron_left;
  static const IconData rightArrow = Icons.chevron_right;
  static const IconData map = Icons.map;
  static const IconData up = Icons.arrow_upward;
  static const IconData down = Icons.arrow_downward;
  static const IconData flashOn = Icons.flash_on_rounded;
  static const IconData flashOff = Icons.flash_off_rounded;
  static const IconData add = Icons.add;
  static const IconData info = Icons.info_outline;

  static Widget backIB(
          {required BuildContext context, VoidCallback? onPressed}) =>
      IconButton(
        icon: Icon(
          IconConsts.arrowPrevious,
          size: 20,
          color: context.colorScheme.inverseSurface,
        ),
        onPressed: onPressed ?? () => Navigator.pop(context),
      );

  static Widget getIcon({Color? color, double? size, required IconData icon}) =>
      Icon(icon, color: color, size: size ?? 20);
}
