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
///File Name: string_consts
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@since 12/01/24
///

class StringC {
  static const String emptyString = '';
  static const String reset = 'Reset';
  static const String filterBy = 'Filter by';
  static const String searchHere = 'Search Here';

  static String showResults(int v) => 'Show $v Result(s)';

  static const String instrument = 'Instrument';
  static const String symbol = 'Symbol';
  static const String timestamp = 'Timestamp';
  static const String previousClose = 'Previous close';
  static const String openInterest = 'Open interest';
  static const String changeInOpenInterest = 'Change in OI';
  static const String ceOI = 'CEOI';
  static const String ceCIOI = 'CECIOI';
  static const String peOI = 'PEOI';
  static const String peCIOI = 'PECIOI';
  static const String openPrice = 'Open price';
  static const String highPrice = 'High price';
  static const String lowPrice = 'Low price';
  static const String closePrice = 'Close price';
  static const String averagePrice = 'Average price';
  static const String ttlTrdQty = 'TTLTrdQty';
  static const String deliveryQuantity = 'Delivery Quantity';
  static const String fiftyTwoWeekHigh = '52 week high';
  static const String fiftyTwoWeekLow = '52 week low';
  static const String futureOIPer = 'Future OI Per';
  static const String pricePer = 'Price per';
  static const String pCR = 'PCR';
  static const String c2Support = 'C2 support';
  static const String c2Resistance = 'C2 resistance';
  static const String c2High = 'C2 high';
  static const String c2Low = 'C2 low';
  static const String volumeFactor = 'Volume factor';
  static const String deliveryFactor = 'Delivery factor';
  static const String support1 = 'Support1';
  static const String support2 = 'Support2';
  static const String resistance1 = 'Resistance1';
  static const String resistance2 = 'Resistance2';
  static const String sortBy = 'SortBy';
  static const List<String> sortByValues = [
    instrument,
    symbol,
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
    timestamp,
  ];
}
