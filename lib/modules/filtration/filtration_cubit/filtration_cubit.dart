part of '../filtration_import.dart';

/// [FilterationCubit] handle delivery list filtration and filtering logic.
class FilterationCubit extends Cubit<FilteredListState> {
  FilterationCubit() : super(FilteredListState(data: []));

  TabController? tabC;

  /// Carries the current state of all the Filters
  /// used in Filtering the delivery list.
  FiltersDm filtersDm = FiltersDm();

  /// Created a generic filtration instance for FinalDataModel.
  GenericFilter<FinalDataModel> filtration = GenericFilter<FinalDataModel>();

  /// Initialize an empty list of FinalDataModel type.
  List<FinalDataModel> filteredData = [];

  /// Method to perform the filtration and filtering logic.
  void filter() {
    List<FinalDataModel> list = filteredData;

    // Define the data source for filtration.
    filtration.defineDataSource(dataSource: list);

    // Add filters based on different criteria.
    // Instrument Filter
    _addRemoveFilter(
      filterKey: AppC.instrumentFilterKey,
      list: filtersDm.instrument,
      filterElement: (m) => m.instrument ?? StringC.emptyString,
    );
    // symbol Filter
    _addRemoveFilter(
      filterKey: AppC.symbolFilterKey,
      list: filtersDm.symbol,
      filterElement: (m) => m.symbol ?? StringC.emptyString,
    );
    // previousClose Filter
    _addRemoveFilter(
      filterKey: AppC.previousCloseFilterKey,
      list: filtersDm.previousClose,
      filterElement: (m) => m.previousClose?.toString() ?? StringC.emptyString,
    );
    // openInterest Filter
    _addRemoveFilter(
      filterKey: AppC.openInterestFilterKey,
      list: filtersDm.openInterest,
      filterElement: (m) => m.openInterest?.toString() ?? StringC.emptyString,
    );
    // changeInOpenInterest Filter
    _addRemoveFilter(
      filterKey: AppC.changeInOpenInterestFilterKey,
      list: filtersDm.changeInOpenInterest,
      filterElement: (m) =>
          m.changeInOpenInterest?.toString() ?? StringC.emptyString,
    );
    // ceOI Filter
    _addRemoveFilter(
      filterKey: AppC.ceOIFilterKey,
      list: filtersDm.ceOI,
      filterElement: (m) => m.ceOI?.toString() ?? StringC.emptyString,
    );
    // ceCIOI Filter
    _addRemoveFilter(
      filterKey: AppC.ceCIOIFilterKey,
      list: filtersDm.ceCIOI,
      filterElement: (m) => m.ceCIOI?.toString() ?? StringC.emptyString,
    );
    // peOI Filter
    _addRemoveFilter(
      filterKey: AppC.peOIFilterKey,
      list: filtersDm.peOI,
      filterElement: (m) => m.peOI?.toString() ?? StringC.emptyString,
    );
    // peCIOI Filter
    _addRemoveFilter(
      filterKey: AppC.peCIOIFilterKey,
      list: filtersDm.peCIOI,
      filterElement: (m) => m.peCIOI?.toString() ?? StringC.emptyString,
    );
    // openPrice Filter
    _addRemoveFilter(
      filterKey: AppC.openPriceFilterKey,
      list: filtersDm.openPrice,
      filterElement: (m) => m.openPrice?.toString() ?? StringC.emptyString,
    );
    // highPrice Filter
    _addRemoveFilter(
      filterKey: AppC.highPriceFilterKey,
      list: filtersDm.highPrice,
      filterElement: (m) => m.highPrice?.toString() ?? StringC.emptyString,
    );
    // lowPrice Filter
    _addRemoveFilter(
      filterKey: AppC.lowPriceFilterKey,
      list: filtersDm.lowPrice,
      filterElement: (m) => m.lowPrice?.toString() ?? StringC.emptyString,
    );
    // closePrice Filter
    _addRemoveFilter(
      filterKey: AppC.closePriceFilterKey,
      list: filtersDm.closePrice,
      filterElement: (m) => m.closePrice?.toString() ?? StringC.emptyString,
    );
    // averagePrice Filter
    _addRemoveFilter(
      filterKey: AppC.averagePriceFilterKey,
      list: filtersDm.averagePrice,
      filterElement: (m) => m.averagePrice?.toString() ?? StringC.emptyString,
    );
    // ttlTrdQty Filter
    _addRemoveFilter(
      filterKey: AppC.ttlTrdQtyFilterKey,
      list: filtersDm.ttlTrdQty,
      filterElement: (m) => m.ttlTrdQty?.toString() ?? StringC.emptyString,
    );
    // deliveryQuantity Filter
    _addRemoveFilter(
      filterKey: AppC.deliveryQuantityFilterKey,
      list: filtersDm.deliveryQuantity,
      filterElement: (m) =>
          m.deliveryQuantity?.toString() ?? StringC.emptyString,
    );
    // fiftyTwoWeekHigh Filter
    _addRemoveFilter(
      filterKey: AppC.fiftyTwoWeekHighFilterKey,
      list: filtersDm.fiftyTwoWeekHigh,
      filterElement: (m) =>
          m.fiftyTwoWeekHigh?.toString() ?? StringC.emptyString,
    );
    // fiftyTwoWeekLow Filter
    _addRemoveFilter(
      filterKey: AppC.fiftyTwoWeekLowFilterKey,
      list: filtersDm.fiftyTwoWeekLow,
      filterElement: (m) =>
          m.fiftyTwoWeekLow?.toString() ?? StringC.emptyString,
    );
    // futureOIPer Filter
    _addRemoveFilter(
      filterKey: AppC.futureOIPerFilterKey,
      list: filtersDm.futureOIPer,
      filterElement: (m) => m.futureOIPer?.toString() ?? StringC.emptyString,
    );
    // pricePer Filter
    _addRemoveFilter(
      filterKey: AppC.pricePerFilterKey,
      list: filtersDm.pricePer,
      filterElement: (m) => m.pricePer?.toString() ?? StringC.emptyString,
    );
    // pCR Filter
    _addRemoveFilter(
      filterKey: AppC.pCRFilterKey,
      list: filtersDm.pCR,
      filterElement: (m) => m.pCR?.toString() ?? StringC.emptyString,
    );
    // c2Support Filter
    _addRemoveFilter(
      filterKey: AppC.c2SupportFilterKey,
      list: filtersDm.c2Support,
      filterElement: (m) => m.c2Support?.toString() ?? StringC.emptyString,
    );
    // c2Resistance Filter
    _addRemoveFilter(
      filterKey: AppC.c2ResistanceFilterKey,
      list: filtersDm.c2Resistance,
      filterElement: (m) => m.c2Resistance?.toString() ?? StringC.emptyString,
    );
    // c2High Filter
    _addRemoveFilter(
      filterKey: AppC.c2HighFilterKey,
      list: filtersDm.c2High,
      filterElement: (m) => m.c2High?.toString() ?? StringC.emptyString,
    );
    // c2Low Filter
    _addRemoveFilter(
      filterKey: AppC.c2LowFilterKey,
      list: filtersDm.c2Low,
      filterElement: (m) => m.c2Low?.toString() ?? StringC.emptyString,
    );
    // volumeFactor Filter
    _addRemoveFilter(
      filterKey: AppC.volumeFactorFilterKey,
      list: filtersDm.volumeFactor,
      filterElement: (m) => m.volumeFactor?.toString() ?? StringC.emptyString,
    );
    // deliveryFactor Filter
    _addRemoveFilter(
      filterKey: AppC.deliveryFactorFilterKey,
      list: filtersDm.deliveryFactor,
      filterElement: (m) => m.deliveryFactor?.toString() ?? StringC.emptyString,
    );
    // support1 Filter
    _addRemoveFilter(
      filterKey: AppC.support1FilterKey,
      list: filtersDm.support1,
      filterElement: (m) => m.support1?.toString() ?? StringC.emptyString,
    );
    // support2 Filter
    _addRemoveFilter(
      filterKey: AppC.support2FilterKey,
      list: filtersDm.support2,
      filterElement: (m) => m.support2?.toString() ?? StringC.emptyString,
    );
    // resistance1 Filter
    _addRemoveFilter(
      filterKey: AppC.resistance1FilterKey,
      list: filtersDm.resistance1,
      filterElement: (m) => m.resistance1?.toString() ?? StringC.emptyString,
    );
    // resistance2 Filter
    _addRemoveFilter(
      filterKey: AppC.resistance2FilterKey,
      list: filtersDm.resistance2,
      filterElement: (m) => m.resistance2?.toString() ?? StringC.emptyString,
    );
    // timestamp Filter
    _addRemoveFilter(
      filterKey: AppC.timestampFilterKey,
      list: filtersDm.timestamp,
      filterElement: (m) => m.timestamp ?? StringC.emptyString,
    );

    // Perform the filtration based on added filters and sort the data.
    filtration.runFilter(callback: (list) {
      // Callback have the [Filtered] data list.
      // now Performing [Sorting] on the filtered data.
      _sorting(
        dataList: list,
        isAscending: filtersDm.isAcendingSort,
        callback: (list) {
          // Callback have the [Filtered] and [Sorted] data list.
          // now Performing [Searching]..
          _searching(
              searchElement: (m) => m.instrument ?? StringC.emptyString,
              searchTerm: filtersDm.searchString ?? StringC.emptyString,

              // Callback will have the final data list
              // to shown on the frontend
              callback: (list) => emit(FilteredListState(data: list)),
              dataList: list);
        },
        filtersDm: filtersDm,
      );
    });
  }

  /// Adds Filter dynamiclly.
  void _addRemoveFilter({
    required String filterKey,
    required List<dynamic>? list,
    required Comparable<dynamic> Function(FinalDataModel) filterElement,
  }) {
    if (list?.isNotEmpty ?? false) {
      // Add the filter based on the selected filter value values.
      filtration.addFilter(
          filterName: filterKey,
          filterElement: filterElement,
          filterValue: FilterValueDm(filterValueList: [list]));
    } else {
      // Remove the filter.
      filtration.removeFilter(filterName: filterKey);
    }
  }

  /// Performs sorting of delivery data based on the selected sorting filter.
  void _sorting({
    required bool isAscending,
    required FiltersDm filtersDm,
    List<FinalDataModel>? dataList,
    required Function(List<FinalDataModel>) callback,
  }) {
    final Comparable<dynamic> Function(FinalDataModel) sortElement;
    switch (filtersDm.sort) {
      case SortEnum.symbol:
        sortElement = (FinalDataModel m) => m.symbol ?? StringC.emptyString;
      case SortEnum.timestamp:
        sortElement = (FinalDataModel m) => m.timestamp ?? StringC.emptyString;
      case SortEnum.previousClose:
        sortElement = (FinalDataModel m) =>
            m.previousClose?.toString() ?? StringC.emptyString;
      case SortEnum.openInterest:
        sortElement = (FinalDataModel m) =>
            m.openInterest?.toString() ?? StringC.emptyString;
      case SortEnum.changeInOpenInterest:
        sortElement = (FinalDataModel m) =>
            m.changeInOpenInterest?.toString() ?? StringC.emptyString;
      case SortEnum.ceOI:
        sortElement =
            (FinalDataModel m) => m.ceOI?.toString() ?? StringC.emptyString;
      case SortEnum.ceCIOI:
        sortElement =
            (FinalDataModel m) => m.ceCIOI?.toString() ?? StringC.emptyString;
      case SortEnum.peOI:
        sortElement =
            (FinalDataModel m) => m.peOI?.toString() ?? StringC.emptyString;
      case SortEnum.peCIOI:
        sortElement =
            (FinalDataModel m) => m.peCIOI?.toString() ?? StringC.emptyString;
      case SortEnum.openPrice:
        sortElement = (FinalDataModel m) =>
            m.openPrice?.toString() ?? StringC.emptyString;
      case SortEnum.highPrice:
        sortElement = (FinalDataModel m) =>
            m.highPrice?.toString() ?? StringC.emptyString;
      case SortEnum.lowPrice:
        sortElement =
            (FinalDataModel m) => m.lowPrice?.toString() ?? StringC.emptyString;
      case SortEnum.closePrice:
        sortElement = (FinalDataModel m) =>
            m.closePrice?.toString() ?? StringC.emptyString;
      case SortEnum.averagePrice:
        sortElement = (FinalDataModel m) =>
            m.averagePrice?.toString() ?? StringC.emptyString;
      case SortEnum.ttlTrdQty:
        sortElement = (FinalDataModel m) =>
            m.ttlTrdQty?.toString() ?? StringC.emptyString;
      case SortEnum.deliveryQuantity:
        sortElement = (FinalDataModel m) =>
            m.deliveryQuantity?.toString() ?? StringC.emptyString;
      case SortEnum.fiftyTwoWeekHigh:
        sortElement = (FinalDataModel m) =>
            m.fiftyTwoWeekHigh?.toString() ?? StringC.emptyString;
      case SortEnum.fiftyTwoWeekLow:
        sortElement = (FinalDataModel m) =>
            m.fiftyTwoWeekLow?.toString() ?? StringC.emptyString;
      case SortEnum.futureOIPer:
        sortElement = (FinalDataModel m) =>
            m.futureOIPer?.toString() ?? StringC.emptyString;
      case SortEnum.pricePer:
        sortElement =
            (FinalDataModel m) => m.pricePer?.toString() ?? StringC.emptyString;
      case SortEnum.pCR:
        sortElement =
            (FinalDataModel m) => m.pCR?.toString() ?? StringC.emptyString;
      case SortEnum.c2Support:
        sortElement = (FinalDataModel m) =>
            m.c2Support?.toString() ?? StringC.emptyString;
      case SortEnum.c2Resistance:
        sortElement = (FinalDataModel m) =>
            m.c2Resistance?.toString() ?? StringC.emptyString;
      case SortEnum.c2High:
        sortElement =
            (FinalDataModel m) => m.c2High?.toString() ?? StringC.emptyString;
      case SortEnum.c2Low:
        sortElement =
            (FinalDataModel m) => m.c2Low?.toString() ?? StringC.emptyString;
      case SortEnum.volumeFactor:
        sortElement = (FinalDataModel m) =>
            m.volumeFactor?.toString() ?? StringC.emptyString;
      case SortEnum.deliveryFactor:
        sortElement = (FinalDataModel m) =>
            m.deliveryFactor?.toString() ?? StringC.emptyString;
      case SortEnum.support1:
        sortElement =
            (FinalDataModel m) => m.support1?.toString() ?? StringC.emptyString;
      case SortEnum.support2:
        sortElement =
            (FinalDataModel m) => m.support2?.toString() ?? StringC.emptyString;
      case SortEnum.resistance1:
        sortElement = (FinalDataModel m) =>
            m.resistance1?.toString() ?? StringC.emptyString;
      case SortEnum.resistance2:
        sortElement = (FinalDataModel m) =>
            m.resistance2?.toString() ?? StringC.emptyString;
      default:
        sortElement = (FinalDataModel m) => m.instrument ?? StringC.emptyString;
    }

    // Apply sorting to the delivery data based on the determined sort element.
    filtration.runSort(
      dataList: dataList ?? filteredData,
      isAscending: isAscending,
      sortElement: sortElement,
      callback: callback,
    );
  }

  /// Performs searching of delivery data based on the provided search term and element to search.
  void _searching({
    required Comparable<dynamic> Function(FinalDataModel) searchElement,
    required String searchTerm,
    List<FinalDataModel>? dataList,
    required Function(List<FinalDataModel>) callback,
  }) {
    // Run the search using the GenericFilter class.
    filtration.runSearch(
      callback: callback,
      dataList: dataList ?? filteredData,
      // Define the elements to search within each delivery record.
      searchElement: (m) => [m.symbol ?? StringC.emptyString],
      // Provide the search term to look for within the elements.
      searchTerm: searchTerm,
    );
  }
}
