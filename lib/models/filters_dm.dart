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
///File Name: filters_dm.dart
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/07/23
///
part of 'models.dart';
enum SortEnum {
  symbol,
  instrument,
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
}

/// [FiltersDm] has the current states of the all the filters.
/// it consists the current choice and it's corresponding index.
class FiltersDm {
  List<String?> symbol;
  List<String?> instrument;
  List<String?> timestamp;
  List<double?> previousClose;
  List<double?> openInterest;
  List<double?> changeInOpenInterest;
  List<double?> ceOI;
  List<double?> ceCIOI;
  List<double?> peOI;
  List<double?> peCIOI;
  List<double?> openPrice;
  List<double?> highPrice;
  List<double?> lowPrice;
  List<double?> closePrice;
  List<double?> averagePrice;
  List<double?> ttlTrdQty;
  List<double?> deliveryQuantity;
  List<double?> fiftyTwoWeekHigh;
  List<double?> fiftyTwoWeekLow;
  List<double?> futureOIPer;
  List<double?> pricePer;
  List<double?> pCR;
  List<double?> c2Support;
  List<double?> c2Resistance;
  List<double?> c2High;
  List<double?> c2Low;
  List<double?> volumeFactor;
  List<double?> deliveryFactor;
  List<double?> support1;
  List<double?> support2;
  List<double?> resistance1;
  List<double?> resistance2;
  String? searchString;
  SortEnum sort;
  bool isAcendingSort;

  FiltersDm({
    this.symbol = const [],
    this.instrument = const [],
    this.timestamp = const [],
    this.previousClose = const [],
    this.openInterest = const [],
    this.changeInOpenInterest = const [],
    this.ceOI = const [],
    this.ceCIOI = const [],
    this.peOI = const [],
    this.peCIOI = const [],
    this.openPrice = const [],
    this.highPrice = const [],
    this.lowPrice = const [],
    this.closePrice = const [],
    this.averagePrice = const [],
    this.ttlTrdQty = const [],
    this.deliveryQuantity = const [],
    this.fiftyTwoWeekHigh = const [],
    this.fiftyTwoWeekLow = const [],
    this.futureOIPer = const [],
    this.pricePer = const [],
    this.pCR = const [],
    this.c2Support = const [],
    this.c2Resistance = const [],
    this.c2High = const [],
    this.c2Low = const [],
    this.volumeFactor = const [],
    this.deliveryFactor = const [],
    this.support1 = const [],
    this.support2 = const [],
    this.resistance1 = const [],
    this.resistance2 = const [],
    this.searchString,
    this.sort = SortEnum.instrument,
    this.isAcendingSort = false,
  });
}
