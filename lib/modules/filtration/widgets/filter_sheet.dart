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
///File Name: filter_sheet
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 20/09/23
///

part of '../filtration_import.dart';

/// [FilterType] is a enum that provides us
/// the types of available filters.
enum FilterType {
  instrument,
  symbol,
  timestamp,
  previousClose,
  openInterest,
  changeInOpenInterest,
  ceOI,
  ceCIOI,
  peOI,
  peCIOI,
  openPrice,
  highPrice,
  lowPrice,
  closePrice,
  averagePrice,
  ttlTrdQty,
  deliveryQuantity,
  fiftyTwoWeekHigh,
  fiftyTwoWeekLow,
  futureOIPer,
  pricePer,
  pCR,
  c2Support,
  c2Resistance,
  c2High,
  c2Low,
  volumeFactor,
  deliveryFactor,
  support1,
  support2,
  resistance1,
  resistance2,
  sortBy,
}

/// [FilterPopup] Have the content for
/// the delivery filteration sheet or dialog.
class FilterPopup extends StatefulWidget {
  const FilterPopup({
    super.key,
    required this.filterType,
    required this.cubit,
    required this.dateSets,
  });

  final FilterType filterType;
  final FilterationCubit cubit;
  final List<FinalDataModel> dateSets;

  @override
  State<FilterPopup> createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  /// Filter type to keep track of current selected filter item.
  late FilterType filterType;

  @override
  void initState() {
    filterType = widget.filterType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSingleton().deviceHeight * 0.6,
      child: Column(
        children: [
          // [FilterBy] title and [Reset] button
          // if the device is mobile.
          FilterTitleReset(onReset: _onReset),
          Container(
            // Border
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color:
                            context.colorScheme.onSurface.withOpacity(0.1)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List of different [Filters]
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // [instrument] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.instrument,
                        filterType: FilterType.instrument,
                        widgetFilterType: filterType,
                      ),
                      // [symbol] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.symbol,
                        filterType: FilterType.symbol,
                        widgetFilterType: filterType,
                      ),
                      // [previousClose] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.previousClose,
                        filterType: FilterType.previousClose,
                        widgetFilterType: filterType,
                      ),
                      // [openInterest] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.openInterest,
                        filterType: FilterType.openInterest,
                        widgetFilterType: filterType,
                      ),
                      // [changeInOpenInterest] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.changeInOpenInterest,
                        filterType: FilterType.changeInOpenInterest,
                        widgetFilterType: filterType,
                      ),
                      // [ceOI] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.ceOI,
                        filterType: FilterType.ceOI,
                        widgetFilterType: filterType,
                      ),
                      // [ceCIOI] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.ceCIOI,
                        filterType: FilterType.ceCIOI,
                        widgetFilterType: filterType,
                      ),
                      // [peOI] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.peOI,
                        filterType: FilterType.peOI,
                        widgetFilterType: filterType,
                      ),
                      // [peCIOI] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.peCIOI,
                        filterType: FilterType.peCIOI,
                        widgetFilterType: filterType,
                      ),
                      // [openPrice] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.openPrice,
                        filterType: FilterType.openPrice,
                        widgetFilterType: filterType,
                      ),
                      // [highPrice] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.highPrice,
                        filterType: FilterType.highPrice,
                        widgetFilterType: filterType,
                      ),
                      // [lowPrice] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.lowPrice,
                        filterType: FilterType.lowPrice,
                        widgetFilterType: filterType,
                      ),
                      // [closePrice] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.closePrice,
                        filterType: FilterType.closePrice,
                        widgetFilterType: filterType,
                      ),
                      // [averagePrice] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.averagePrice,
                        filterType: FilterType.averagePrice,
                        widgetFilterType: filterType,
                      ),
                      // [ttlTrdQty] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.ttlTrdQty,
                        filterType: FilterType.ttlTrdQty,
                        widgetFilterType: filterType,
                      ),
                      // [deliveryQuantity] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.deliveryQuantity,
                        filterType: FilterType.deliveryQuantity,
                        widgetFilterType: filterType,
                      ),
                      // [fiftyTwoWeekHigh] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.fiftyTwoWeekHigh,
                        filterType: FilterType.fiftyTwoWeekHigh,
                        widgetFilterType: filterType,
                      ),
                      // [fiftyTwoWeekLow] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.fiftyTwoWeekLow,
                        filterType: FilterType.fiftyTwoWeekLow,
                        widgetFilterType: filterType,
                      ),
                      // [futureOIPer] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.futureOIPer,
                        filterType: FilterType.futureOIPer,
                        widgetFilterType: filterType,
                      ),
                      // [pricePer] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.pricePer,
                        filterType: FilterType.pricePer,
                        widgetFilterType: filterType,
                      ),
                      // [pCR] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.pCR,
                        filterType: FilterType.pCR,
                        widgetFilterType: filterType,
                      ),
                      // [c2Support] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.c2Support,
                        filterType: FilterType.c2Support,
                        widgetFilterType: filterType,
                      ),
                      // [c2Resistance] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.c2Resistance,
                        filterType: FilterType.c2Resistance,
                        widgetFilterType: filterType,
                      ),
                      // [c2High] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.c2High,
                        filterType: FilterType.c2High,
                        widgetFilterType: filterType,
                      ),
                      // [c2Low] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.c2Low,
                        filterType: FilterType.c2Low,
                        widgetFilterType: filterType,
                      ),
                      // [volumeFactor] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.volumeFactor,
                        filterType: FilterType.volumeFactor,
                        widgetFilterType: filterType,
                      ),
                      // [deliveryFactor] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.deliveryFactor,
                        filterType: FilterType.deliveryFactor,
                        widgetFilterType: filterType,
                      ),
                      // [support1] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.support1,
                        filterType: FilterType.support1,
                        widgetFilterType: filterType,
                      ),
                      // [support2] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.support2,
                        filterType: FilterType.support2,
                        widgetFilterType: filterType,
                      ),
                      // [resistance1] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.resistance1,
                        filterType: FilterType.resistance1,
                        widgetFilterType: filterType,
                      ),
                      // [resistance2] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.resistance2,
                        filterType: FilterType.resistance2,
                        widgetFilterType: filterType,
                      ),
                      // [sortBy] filter.
                      FilterTile(
                        onTap: (ft) => setState(() => filterType = ft),
                        text: StringC.sortBy,
                        filterType: FilterType.sortBy,
                        widgetFilterType: filterType,
                      ),
                    ],
                  ),
                ).expand(),

                // Divider.
                Container(
                  height: double.infinity,
                  width: 1,
                  color: context.colorScheme.onSurface.withOpacity(0.1),
                ),

                // Filters item list,
                // list of the filter items as per the selected filter.
                FilterItemsList(
                  setState: setState,
                  filterType: filterType,
                  filtrationCubit: widget.cubit,
                  onChange: _filterChangeCall,
                  dateSets: widget.dateSets, cubit: widget.cubit,
                ).expand(flex: 2)
              ],
            ),
          ).expand(),

          // Filter buttons
          // to pop the overlay and get the home screen again.
          FilterButtons(
            filtrationCubit: widget.cubit,
            onReset: _onReset,
          ),
        ],
      ),
    );
  }

  /// [_onReset] Will reset all the filter to their ideal state.
  void _onReset() {
    setState(() {
      widget.cubit.filtersDm
        ..symbol = []
        ..timestamp = []
        ..previousClose = []
        ..openInterest = []
        ..changeInOpenInterest = []
        ..ceOI = []
        ..ceCIOI = []
        ..peOI = []
        ..peCIOI = []
        ..openPrice = []
        ..highPrice = []
        ..lowPrice = []
        ..closePrice = []
        ..averagePrice = []
        ..ttlTrdQty = []
        ..deliveryQuantity = []
        ..fiftyTwoWeekHigh = []
        ..fiftyTwoWeekLow = []
        ..futureOIPer = []
        ..pricePer = []
        ..pCR = []
        ..c2Support = []
        ..c2Resistance = []
        ..c2High = []
        ..c2Low = []
        ..volumeFactor = []
        ..deliveryFactor = []
        ..support1 = []
        ..support2 = []
        ..resistance1 = []
        ..resistance2 = []
        ..sort = SortEnum.symbol
        ..isAcendingSort = false;
      _filterChangeCall();
    });
  }

  /// [_filterChangeCall] updates the delivery list
  /// according to the currently selected filters.
  void _filterChangeCall() => widget.cubit.filter();
}
