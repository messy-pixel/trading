part of 'models.dart';

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
///File Name: final_data_model
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 13/01/24
///

class FinalDataModel implements BaseSqliteModel {
  String? symbol;
  String? instrument;
  String? timestamp;
  double? previousClose;
  double? openInterest;
  double? changeInOpenInterest;
  double? ceOI;
  double? ceCIOI;
  double? peOI;
  double? peCIOI;
  double? openPrice;
  double? highPrice;
  double? lowPrice;
  double? closePrice;
  double? averagePrice;
  double? ttlTrdQty;
  double? deliveryQuantity;
  double? fiftyTwoWeekHigh;
  double? fiftyTwoWeekLow;
  double? futureOIPer;
  double? pricePer;
  double? pCR;
  double? c2Support;
  double? c2Resistance;
  double? c2High;
  double? c2Low;
  double? volumeFactor;
  double? deliveryFactor;
  double? support1;
  double? support2;
  double? resistance1;
  double? resistance2;

  FinalDataModel({
    this.symbol,
    this.instrument,
    this.timestamp,
    this.previousClose,
    this.openInterest,
    this.changeInOpenInterest,
    this.ceOI,
    this.ceCIOI,
    this.peOI,
    this.peCIOI,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.closePrice,
    this.averagePrice,
    this.ttlTrdQty,
    this.deliveryQuantity,
    this.fiftyTwoWeekHigh,
    this.fiftyTwoWeekLow,
    this.futureOIPer,
    this.pricePer,
    this.pCR,
    this.c2Support,
    this.c2Resistance,
    this.c2High,
    this.c2Low,
    this.volumeFactor,
    this.deliveryFactor,
    this.support1,
    this.support2,
    this.resistance1,
    this.resistance2,
  });

  @override
  fromJson(Map<String, dynamic> json) => FinalDataModel(
        symbol: json['symbol'],
        instrument: json['instrument'],
        timestamp: json['timestamp'],
        previousClose: json['previousClose'],
        openInterest: json['openInterest'],
        changeInOpenInterest: json['changeInOpenInterest'],
        ceOI: json['ceOI'],
        ceCIOI: json['ceCIOI'],
        peOI: json['peOI'],
        peCIOI: json['peCIOI'],
        openPrice: json['openPrice'],
        highPrice: json['highPrice'],
        lowPrice: json['lowPrice'],
        closePrice: json['closePrice'],
        averagePrice: json['averagePrice'],
        ttlTrdQty: json['ttlTrdQty'],
        deliveryQuantity: json['deliveryQuantity'],
        fiftyTwoWeekHigh: json['fiftyTwoWeekHigh'],
        fiftyTwoWeekLow: json['fiftyTwoWeekLow'],
        futureOIPer: json['futureOIPer'],
        pricePer: json['pricePer'],
        pCR: json['pCR'],
        c2Support: json['c2Support'],
        c2Resistance: json['c2Resistance'],
        c2High: json['c2High'],
        c2Low: json['c2Low'],
        volumeFactor: json['volumeFactor'],
        deliveryFactor: json['deliveryFactor'],
        support1: json['support1'],
        support2: json['support2'],
        resistance1: json['resistance1'],
        resistance2: json['resistance2'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'instrument': instrument,
        'timestamp': timestamp,
        'previousPrice': previousClose,
        'openPrice': openPrice,
        'openInterest': openInterest,
        'changeInOpenInterest': changeInOpenInterest,
        'ceOI': ceOI,
        'ceCIOI': ceCIOI,
        'peOI': peOI,
        'peCIOI': peCIOI,
        'highPrice': highPrice,
        'lowPrice': lowPrice,
        'closePrice': closePrice,
        'averagePrice': averagePrice,
        'ttlTrdQty': ttlTrdQty,
        'deliveryQuantity': deliveryQuantity,
        'fiftyTwoWeekHigh': fiftyTwoWeekHigh,
        'fiftyTwoWeekLow': fiftyTwoWeekLow,
        'futureOIPer': futureOIPer,
        'pricePer': pricePer,
        'pCR': pCR,
        'c2Support': c2Support,
        'c2Resistance': c2Resistance,
        'c2High': c2High,
        'c2Low': c2Low,
        'volumeFactor': volumeFactor,
        'deliveryFactor': deliveryFactor,
        'support1': support1,
        'support2': support2,
        'resistance1': resistance1,
        'resistance2': resistance2,
      };

  set symbolSet(String? v) => symbol = v;

  set instrumentSet(String? v) => instrument = v;

  set timestampSet(String? v) => timestamp = v;

  set previousCloseSet(double? v) => previousClose = v;

  set openInterestSet(double? v) => openInterest = v;

  set changeInOpenInterestSet(double? v) => changeInOpenInterest = v;

  set ceOISet(double? v) => ceOI = v;

  set ceCIOISet(double? v) => ceCIOI = v;

  set peOISet(double? v) => peOI = v;

  set peCIOISet(double? v) => peCIOI = v;

  set openPriceSet(double? v) => openPrice = v;

  set highPriceSet(double? v) => highPrice = v;

  set lowPriceSet(double? v) => lowPrice = v;

  set closePriceSet(double? v) => closePrice = v;

  set averagePriceSet(double? v) => averagePrice = v;

  set ttlTrdQtySet(double? v) => ttlTrdQty = v;

  set deliveryQuantitySet(double? v) => deliveryQuantity = v;

  set fiftyTwoWeekHighSet(double? v) => fiftyTwoWeekHigh = v;

  set fiftyTwoWeekLowSet(double? v) => fiftyTwoWeekLow = v;

  set futureOIPerSet(double? v) => futureOIPer = v;

  set pricePerSet(double? v) => pricePer = v;

  set pCRSet(double? v) => pCR = v;

  set c2SupportSet(double? v) => c2Support = v;

  set c2ResistanceSet(double? v) => c2Resistance = v;

  set c2HighSet(double? v) => c2High = v;

  set c2LowSet(double? v) => c2Low = v;

  set volumeFactorSet(double? v) => volumeFactor = v;

  set deliveryFactorSet(double? v) => deliveryFactor = v;

  set support1Set(double? v) => support1 = v;

  set support2Set(double? v) => support2 = v;

  set resistance1Set(double? v) => resistance1 = v;

  set resistance2Set(double? v) => resistance2 = v;
}
