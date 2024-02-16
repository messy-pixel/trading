import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:tempt/modules/setup/setup.dart';

import '../modules/home_screen/home_screen.dart';

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
///File Name: route_generator
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 12/01/24
///

/// The Page transition animation enum.
enum PageTransitionAnimation { slide, fade, normal }

class ConstRoutes {
  /// set up page route.
  static const String setup = '/setup';

  /// home screen route.
  static const String homeScreen = '/homeScreen';
}

/// The RouteGenerator class is responsible for generating routes based on the
/// given route settings and animations defined in [transition].
class RouteGenerator {
  /// The PageTransition animation to be used for route transitions.
  static PageTransitionAnimation transition = PageTransitionAnimation.normal;

  /// Generates a route based on the given [RouteSettings].
  /// Returns a [Route] object representing the destination page.
  static Route generate(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      // Setup route.
      case ConstRoutes.setup:
        page = const Setup();
        break;
      // Home screen route.
      case ConstRoutes.homeScreen:
        page = const HomeScreen();
        break;

      // Default case when the requested route is not found.
      default:
        page = const BaseText('Invalid Path').center();
        break;
    }

    // To animate the page transition, based on the chosen [transition].
    switch (transition) {
      // Fade animation.
      case PageTransitionAnimation.fade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, anim, secondaryAnim, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );

      // Slide animation.
      case PageTransitionAnimation.slide:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // The tween object to define slide animation from right to left.
            final Animatable<Offset> routeAnimation = Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.ease),
            );

            return SlideTransition(
              position: animation.drive(routeAnimation),
              child: child,
            );
          },
        );

      // Default case, use a MaterialPageRoute for the transition.
      default:
        return MaterialPageRoute(builder: (context) => page);
    }
  }
}
