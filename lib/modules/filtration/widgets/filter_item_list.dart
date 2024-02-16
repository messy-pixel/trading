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
///File Name: filter_items_list
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 06/10/23
///

part of '../filtration_import.dart';

/// [FilterItemsList] consists a list of [FilterItermListTile]
/// having different Filter items for the single filter.
class FilterItemsList extends StatelessWidget {
  const FilterItemsList({
    super.key,
    required this.onChange,
    required this.filterType,
    required this.setState,
    required this.filtrationCubit,
    required this.dateSets,
    required this.cubit,
  });

  final FilterationCubit cubit;
  final VoidCallback onChange;
  final FilterType filterType;
  final List<FinalDataModel> dateSets;
  final void Function(VoidCallback) setState;
  final FilterationCubit filtrationCubit;

  @override
  Widget build(BuildContext context) {
    switch (filterType) {
      case FilterType.symbol:
        final List<String?> symbol = dateSets.map((e) => e.symbol).toList();
        return SingleFilterItemsList(
          onChange: (v) => setState(() {
            if (cubit.filtersDm.symbol.remove(v)) {
              cubit.filtersDm.symbol.add(v);
            }
            onChange();
          }),
          dataList: symbol,
          selectedList: cubit.filtersDm.symbol,
        );
      case FilterType.previousClose:
        final List<double?> list =
            dateSets.map((e) => e.previousClose).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.previousClose = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.openInterest:
        final List<double?> list = dateSets.map((e) => e.openInterest).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.openInterest = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.changeInOpenInterest:
        final List<double?> list =
            dateSets.map((e) => e.changeInOpenInterest).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.changeInOpenInterest = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.ceOI:
        final List<double?> list = dateSets.map((e) => e.ceOI).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.ceOI = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.ceCIOI:
        final List<double?> list = dateSets.map((e) => e.ceCIOI).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.ceCIOI = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.peOI:
        final List<double?> list = dateSets.map((e) => e.peOI).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.peOI = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.peCIOI:
        final List<double?> list = dateSets.map((e) => e.peCIOI).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.peCIOI = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.openPrice:
        final List<double?> list = dateSets.map((e) => e.openPrice).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.openPrice = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.highPrice:
        final List<double?> list = dateSets.map((e) => e.highPrice).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.highPrice = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.lowPrice:
        final List<double?> list = dateSets.map((e) => e.lowPrice).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.lowPrice = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.closePrice:
        final List<double?> list = dateSets.map((e) => e.closePrice).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.closePrice = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.averagePrice:
        final List<double?> list = dateSets.map((e) => e.averagePrice).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.averagePrice = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.ttlTrdQty:
        final List<double?> list = dateSets.map((e) => e.ttlTrdQty).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.ttlTrdQty = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.deliveryQuantity:
        final List<double?> list =
            dateSets.map((e) => e.deliveryQuantity).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.deliveryQuantity = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.fiftyTwoWeekHigh:
        final List<double?> list =
            dateSets.map((e) => e.fiftyTwoWeekHigh).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.fiftyTwoWeekHigh = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.fiftyTwoWeekLow:
        final List<double?> list =
            dateSets.map((e) => e.fiftyTwoWeekLow).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.fiftyTwoWeekLow = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.futureOIPer:
        final List<double?> list = dateSets.map((e) => e.futureOIPer).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.futureOIPer = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.pricePer:
        final List<double?> list = dateSets.map((e) => e.pricePer).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.pricePer = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.pCR:
        final List<double?> list = dateSets.map((e) => e.pCR).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.pCR = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.c2Support:
        final List<double?> list = dateSets.map((e) => e.c2Support).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.c2Support = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.c2Resistance:
        final List<double?> list = dateSets.map((e) => e.c2Resistance).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.c2Resistance = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.c2High:
        final List<double?> list = dateSets.map((e) => e.c2High).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.c2High = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.c2Low:
        final List<double?> list = dateSets.map((e) => e.c2Low).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.c2Low = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.volumeFactor:
        final List<double?> list = dateSets.map((e) => e.volumeFactor).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.volumeFactor = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.deliveryFactor:
        final List<double?> list =
            dateSets.map((e) => e.deliveryFactor).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.deliveryFactor = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.support1:
        final List<double?> list = dateSets.map((e) => e.support1).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.support1 = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.support2:
        final List<double?> list = dateSets.map((e) => e.support2).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.support2 = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.resistance1:
        final List<double?> list = dateSets.map((e) => e.resistance1).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.resistance1 = _onSliderChange(list, c);
              onChange();
            });
      case FilterType.resistance2:
        final List<double?> list = dateSets.map((e) => e.resistance2).toList();
        list.sort((a, b) => a?.compareTo(b ?? 0) ?? 0);
        return CSlider(
            min: list.first ?? 0,
            max: list.last ?? 0,
            divisions: list.length,
            range: RangeValues(list.first ?? 0, list.last ?? 0),
            onChangeEnd: (c) {
              cubit.filtersDm.resistance2 = _onSliderChange(list, c);
              onChange();
            });

      // If the select filter is [DeliveryDate]
      // than showing the list of different delivery date.
      // [AllTime], [Today], [ThisWeek] and [CustomDates]
      // are the different delivery date present in this filter.
      // where in the customDates user can select a custom range.
      // case FilterType.date:
      //   return ListView.builder(
      //     itemCount: StringC.dateFilterItemList.length,
      //     itemBuilder: (context, index) => Builder(builder: (ct) {
      //       return FilterItermListTile(
      //         dateRange:
      //             '${cubit.filtersDm.customStartDate?.toStringDate}~${cubit.filtersDm.customEndDate?.toStringDate} ',
      //         text: StringC.dateFilterItemList[index],
      //         onTap: () {
      //           if (index != 3) {
      //             cubit.filtersDm.setDateFilterIndex = index;
      //             setState(() {});
      //             onChange();
      //           } else {
      //             Navigator.pop(context);
      //             // Date range selector if the user opt for custom dates filter.
      //             BasePopup.openDialogBottomSheetAccordingly(
      //                 context: context,
      //                 showCloseButton: true,
      //                 title: StringC.selectDateRange,
      //                 child: CustomDateRangePicker(
      //                     minimumDate:
      //                         DateTime.now().subtract(const Duration(days: 30)),
      //                     maximumDate: DateTime.now(),
      //                     initialEndDate:
      //                         cubit.filtersDm.customEndDate,
      //                     initialStartDate:
      //                         cubit.filtersDm.customStartDate,
      //                     backgroundColor: context.colorScheme.outline,
      //                     primaryColor: context.colorScheme.primary,
      //                     onApplyClick:
      //                         (DateTime startDate, DateTime endDate, c) {
      //                       cubit.filtersDm.setDateFilterIndex = 3;
      //                       cubit.filtersDm.setCustomStartDate =
      //                           startDate;
      //                       cubit.filtersDm.setCustomEndDate = endDate;
      //                       // setState(() {});
      //                       onChange();
      //                       _openFiltersSheet(c);
      //                     },
      //                     onCancelCallback: (c) => _openFiltersSheet(c)));
      //           }
      //         },
      //         isSelected: cubit.filtersDm.dateFilterIndex == index,
      //       );
      //     }),
      //   );

      // If the select filter is [SortBy]
      // than showing the list of different Sorting techniques.
      case FilterType.sortBy:
        return ListView.builder(
          itemCount: SortEnum.values.length,
          itemBuilder: (context, index) => FilterItermListTile(
            sorting: true,
            onTap: () {
              cubit.filtersDm.sort == SortEnum.values[index]
                  ? cubit.filtersDm.isAcendingSort =
                      !cubit.filtersDm.isAcendingSort
                  : (
                      cubit.filtersDm.sort = SortEnum.values[index],
                      cubit.filtersDm.isAcendingSort = false
                    );
              setState(() {});
              onChange();
            },
            text: SortEnum.values[index].name,
            ascending: cubit.filtersDm.isAcendingSort,
            isSelected: cubit.filtersDm.sort == SortEnum.values[index],
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  List<double?> _onSliderChange(List<double?> list, RangeValues range) {
    return list.sublist(list.indexOf(range.start.ceilToDouble()),
        list.indexOf(range.end.ceilToDouble()));
  }
}

class SingleFilterItemsList extends StatelessWidget {
  const SingleFilterItemsList({
    super.key,
    required this.onChange,
    required this.dataList,
    required this.selectedList,
  });

  final void Function(String v) onChange;
  final List<dynamic> dataList;
  final List<dynamic>? selectedList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (context, index) => dataList[index] != null
          ? FilterItermListTile(
              text: dataList[index].toString(),
              onTap: () => onChange(dataList[index]),
              isSelected: selectedList?.contains(dataList[index]),
            )
          : const SizedBox.shrink(),
    );
  }
}

class CSlider extends StatefulWidget {
  const CSlider({
    super.key,
    required this.min,
    required this.max,
    required this.range,
    required this.onChangeEnd,
    required this.divisions,
  });

  final double min;
  final double max;
  final int divisions;
  final RangeValues range;
  final void Function(RangeValues) onChangeEnd;

  @override
  State<CSlider> createState() => _CSliderState();
}

class _CSliderState extends State<CSlider> {
  late RangeValues range;

  @override
  void initState() {
    range = widget.range;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CSlider oldWidget) {
    if (oldWidget.range != widget.range) {
      range = widget.range;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Column(
            children: [
              // Slider widget
              RangeSlider(
                min: widget.min,
                max: widget.max,
                values: range,
                divisions: widget.divisions,
                onChangeEnd: widget.onChangeEnd,
                // labels:
                //     RangeLabels(range.start.toString(), range.end.toString()),
                onChanged: (v) => setState(() => range = v),
              ),
            ],
          ),
        ),

        // List of title of divisions.
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [widget.min.toString(), widget.max.toString()]
              .map(
                (e) => Text(e,
                    style: context.textTheme.labelSmall
                        ?.copyWith(color: ColorConstant.grey)),
              )
              .toList(),
        ).paddingVertical16()
      ],
    ).paddingAll16();
  }
}
