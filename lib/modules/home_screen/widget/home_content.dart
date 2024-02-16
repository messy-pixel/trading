import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempt/base/base_error.dart';
import 'package:tempt/consts/date_time_consts.dart';
import 'package:tempt/consts/string_consts.dart';
import 'package:tempt/modules/home_screen/cubit/fetch_data_cubit.dart';
import 'package:tempt/utils/utils.dart';
import 'package:tempt/utils/widget_exntesion.dart';

import '../../../consts/theme_consts.dart';
import '../../../models/models.dart';
import '../../filtration/filtration_import.dart';
import '../../filtration/widgets/date_filter_bar.dart';

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
///File Name: home_content
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 12/01/24
///
///
class HomeContent extends StatefulWidget {
  const HomeContent({super.key, required this.dataSets});

  final List<FinalDataModel> dataSets;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late final FilterationCubit cubit;
  late DateTime date;

  @override
  void initState() {
    widget.dataSets.sort((a, b) => DateTimeC.formatToDate(a.timestamp ?? '')
        .compareTo(DateTimeC.formatToDate(b.timestamp ?? '')));
    date = widget.dataSets.isNotEmpty
        ? DateTimeC.formatToDate(widget.dataSets.last.timestamp ?? '')
        : DateTime.now();
    cubit = FilterationCubit();
    cubit.filteredData = widget.dataSets;
    cubit.filter();
    cubit.tabC = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<FinalDataModel> localDs =
        cubit.filteredData = widget.dataSets.where((element) {
      return element.timestamp?.toUpperCase() == DateTimeC.formatFromDate(date);
    }).toList();
    cubit.filter();
    return Column(
      children: [
        // Date changer and pre defined filters.
        DateAndPreFilter(
          cubit: cubit,
          dateTime: date,
          onCalenderTap: _onCalenderTap,
          onNext: () => setState(() => date = date.add(1.days)),
          onPrevious: () => setState(() => date = date.subtract(1.days)),
        ),
        8.sizedHeightBox,

        // Search bar and Filter sheet button.
        BlocBuilder(
            bloc: cubit,
            builder: (context, state) => localDs.isNotEmpty
                ? SearchFilterBar(
                    cubit: cubit,
                    dataSets: (state as FilteredListState).data,
                  ).fadeIn()
                : const SizedBox.shrink()),
        8.sizedHeightBox,

        // Data list.
        BlocConsumer(
          bloc: cubit,
          listener: (context, state) {},
          builder: (context, state) {
            final s = state as FilteredListState;
            if (s.data.isNotEmpty) {
              return ListView.separated(
                itemCount: s.data.length,
                separatorBuilder: (context, index) => 8.sizedHeightBox,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(s.data[index].symbol?.capFirstLetter ??
                          StringC.emptyString),
                      subtitle:
                          Text(s.data[index].timestamp ?? StringC.emptyString),
                      trailing: Text(s.data[index].closePrice?.toString() ??
                          StringC.emptyString),
                    ),
                  );
                },
              ).fadeIn().expand();
            } else {
              return const BaseError(errorType: ErrorTypes.noDataFound);
            }
          },
        )
      ],
    ).paddingAll16();
  }

  // on Date tap.
  Future<void> _onCalenderTap() async {
    final DateTime? tempDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(30.days),
      lastDate: DateTime.now().add(30.days),
      builder: (context, child) => Theme(
        data: ThemeC.lightTheme.copyWith(
            textTheme: TextTheme(
                headlineSmall: context.textTheme.headlineSmall
                    ?.copyWith(fontSize: 32, fontWeight: FontWeight.w500))),
        child: child!,
      ),
    );
    if (tempDate != null) setState(() => date = tempDate);
  }
}
