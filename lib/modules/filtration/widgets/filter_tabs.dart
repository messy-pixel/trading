import 'package:flutter/material.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:tempt/modules/filtration/filtration_import.dart';
import 'package:tempt/utils/utils.dart';

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
///File Name: filter_tabs
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 15/01/24
///

/// [SlotsTabBar] is a [StatelessWidget] that helps us to get the tab bar view
/// with the tabs that are needed on tha basis of the [timeSlots] provided.
///
/// Following are the parameters passed.
///
/// 1. [medPassBloc] a reference to the [MedPassBloc].
/// 2. [timeSlots] the time slots to be shows in the tabs in tabbar.
class SlotsTabBar extends StatelessWidget {
  final FilterationCubit cubit;

  const SlotsTabBar({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      isScrollable: true,
      labelStyle: context.textTheme.labelMedium
          ?.copyWith(color: context.colorScheme.primary),
      unselectedLabelStyle: context.textTheme.labelMedium,
      indicator: BoxDecoration(
        borderRadius: SizeConstant.borderRadius10,
        color: context.colorScheme.secondary.withOpacity(0.1),
      ),
      controller: cubit.tabC,
      tabs: List.generate(
        4,
        (index) => Tab(
            child: Text('Filtration $index').paddingHorizontal(10).fadeIn()),
      ),
    );
  }
}
