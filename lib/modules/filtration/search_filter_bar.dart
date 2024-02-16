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
///File Name: search_filter_widget
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 18/07/23
///
part of 'filtration_import.dart';

/// [SearchFilterBar] consists [SearchDelivery] field
/// and [Filters] button. and will be used in
/// [DeliveryListFilterAndButtons] Widget and
/// shown in [HomeScreen].
class SearchFilterBar extends StatefulWidget {
  const SearchFilterBar({Key? key, required this.cubit, required this.dataSets})
      : super(key: key);

  final FilterationCubit cubit;
  final List<FinalDataModel> dataSets;

  @override
  State<SearchFilterBar> createState() => _SearchFilterBarState();
}

class _SearchFilterBarState extends State<SearchFilterBar> {
  /// Delivery Search textField controller and focus node.
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // [DeliverySearch] field.
        SearchField(
          controller: _searchController,
          focusNode: _searchFocusNode,
          onChange: _filterChangeCall,
        ).expand(),
        8.sizedWidthBox,
        Stack(
          children: [
            Card(
              child: InkWell(
                borderRadius: SizeConstant.borderRadius8,
                // Filter pop up having all the filter
                // to filter the delivery with.
                onTap: () => BasePopup.openDialogBottomSheetAccordingly(
                    context: context,
                    showCloseButton: true,
                    showSheetTitle: false,
                    zeroPadding: true,
                    title: StringC.filterBy,
                    width: AppSingleton().deviceWidth * 0.5,
                    child: FilterPopup(
                      filterType: FilterType.symbol,
                      cubit: widget.cubit,
                      dateSets: widget.dataSets,
                    )),
                child: Icon(
                  Icons.filter_alt_outlined,
                  color: context.colorScheme.inverseSurface,
                ).paddingSymmetric(vertical: 13, horizontal: 16),
              ),
            ),
            // Rounded notification dot
            // to indicate the no of filter applied at the moment.
            BlocBuilder(
              bloc: widget.cubit,
              builder: (context, state) {
                return _appliedFilters != '0'
                    ? CircleAvatar(
                        maxRadius: 8,
                        child: Text(
                          _appliedFilters,
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: context.colorScheme.onPrimary),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ).positioned(right: 4, top: 4)
          ],
        ),
      ],
    );
  }

  /// [_appliedFilters] Returns a number in String as a count of
  /// how many filters are applied right now,
  /// So that user get the idea of there's
  /// some filter are selected which listing
  /// the current deliveries.
  String get _appliedFilters {
    int filterCount = 0;

    for (final List? e in [
      widget.cubit.filtersDm.symbol,
      widget.cubit.filtersDm.instrument,
      widget.cubit.filtersDm.timestamp,
      widget.cubit.filtersDm.previousClose,
      widget.cubit.filtersDm.openInterest,
      widget.cubit.filtersDm.changeInOpenInterest,
      widget.cubit.filtersDm.ceOI,
      widget.cubit.filtersDm.ceCIOI,
      widget.cubit.filtersDm.peOI,
      widget.cubit.filtersDm.peCIOI,
      widget.cubit.filtersDm.openPrice,
      widget.cubit.filtersDm.highPrice,
      widget.cubit.filtersDm.lowPrice,
      widget.cubit.filtersDm.closePrice,
      widget.cubit.filtersDm.averagePrice,
      widget.cubit.filtersDm.ttlTrdQty,
      widget.cubit.filtersDm.deliveryQuantity,
      widget.cubit.filtersDm.fiftyTwoWeekHigh,
      widget.cubit.filtersDm.fiftyTwoWeekLow,
      widget.cubit.filtersDm.futureOIPer,
      widget.cubit.filtersDm.pricePer,
      widget.cubit.filtersDm.pCR,
      widget.cubit.filtersDm.c2Support,
      widget.cubit.filtersDm.c2Resistance,
      widget.cubit.filtersDm.c2High,
      widget.cubit.filtersDm.c2Low,
      widget.cubit.filtersDm.volumeFactor,
      widget.cubit.filtersDm.deliveryFactor,
      widget.cubit.filtersDm.support1,
      widget.cubit.filtersDm.support2,
      widget.cubit.filtersDm.resistance1,
      widget.cubit.filtersDm.resistance2,
    ]) {
      if (e != null && e.isNotEmpty) filterCount++;
    }
    if (widget.cubit.filtersDm.sort != SortEnum.symbol) filterCount++;

    return filterCount.toString();
  }

  /// [_filterChangeCall] callback to updates
  /// the deliveries according to the changed filter.
  void _filterChangeCall(String v) {
    widget.cubit.filtersDm.searchString = v;
    widget.cubit.filter();
  }
}
