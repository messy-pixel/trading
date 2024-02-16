import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/constant/constant.dart';
import 'package:tempt/consts/date_time_consts.dart';
import 'package:tempt/consts/icon_consts.dart';
import 'package:tempt/utils/utils.dart';
import 'package:tempt/utils/widget_exntesion.dart';

import '../filtration_import.dart';
import 'filter_tabs.dart';

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
///File Name: date_filter_bar
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 15/01/24
///

/// [DateAndPreFilter] is a [StatelessWidget] that provides us with a widget to
/// show a widgets that consists of Row to choose date and also slots that are
/// available to be selected.
///
/// Following are the parameters to be passed.
/// 1. [dateTime] current date and time.
/// 2. [onPrevious] a callback when previous button is pressed.
/// 3. [onNext] a callback when next button is pressed.
/// 4. [onCalenderTap] a callback when calender icon is taped.
class DateAndPreFilter extends StatelessWidget {
  final DateTime dateTime;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onCalenderTap;
  final FilterationCubit cubit;

  const DateAndPreFilter({
    super.key,
    required this.dateTime,
    required this.onPrevious,
    required this.onNext,
    required this.onCalenderTap,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorTheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: SizeConstant.borderRadius10,
        color: colorTheme.surface,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DateRow(
            dateTime: dateTime,
            onPrevious: onPrevious,
            onNext: onNext,
            onCalenderTap: onCalenderTap,
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => SlotsTabBar(cubit: cubit).center(),
          ).paddingVertical8()
        ],
      ),
    );
  }
}

class DateRow extends StatelessWidget {
  final DateTime dateTime;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onCalenderTap;

  const DateRow({
    super.key,
    required this.dateTime,
    required this.onPrevious,
    required this.onNext,
    required this.onCalenderTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: IconTheme(
            data: IconThemeData(color: context.colorScheme.primary, size: 24),
            child: const Icon(IconConsts.arrowPrevious),
          ),
        ),
        TextButton(
          onPressed: onCalenderTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                data: IconThemeData(
                  color: Theme.of(context).primaryColor,
                  size: 24,
                ),
                child: const Icon(Icons.calendar_today),
              ),
              8.sizedWidthBox,
              Text(
                DateTimeC.dateMonthDay(dateTime),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ).expand(),
        IconButton(
          onPressed: onNext,
          icon: IconTheme(
            data: IconThemeData(color: context.colorScheme.primary, size: 24),
            child: const Icon(IconConsts.arrowNext),
          ),
        ),
      ],
    );
  }
}
