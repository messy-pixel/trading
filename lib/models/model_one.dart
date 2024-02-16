part of 'models.dart';

class ModelOne implements CsvConvertible<ModelOne>, BaseSqliteModel {
  final String? symbol;
  final String? series;
  final String? date;
  final String? pervClose;
  final String? openPrice;
  final String? highPrice;
  final String? lowPrice;
  final String? lastPrice;
  final String? closePrice;
  final String? avgPrice;
  final String? ttlTrdQty;
  final String? turnoverLacs;
  final String? noOfTrades;
  final String? delQty;
  final String? delPer;

  ModelOne({
    this.symbol,
    this.series,
    this.date,
    this.pervClose,
    this.openPrice,
    this.highPrice,
    this.lowPrice,
    this.lastPrice,
    this.closePrice,
    this.avgPrice,
    this.ttlTrdQty,
    this.turnoverLacs,
    this.noOfTrades,
    this.delQty,
    this.delPer,
  });

  @override
  int noOfParameters() => [
        symbol,
        series,
        date,
        pervClose,
        openPrice,
        highPrice,
        lowPrice,
        lastPrice,
        closePrice,
        avgPrice,
        ttlTrdQty,
        turnoverLacs,
        noOfTrades,
        delQty,
        delPer,
      ].where((e) => e == null).length;

  @override
  fromCsv(List<dynamic> row) => ModelOne(
        symbol: row[0].toString().trim(),
        series: row[1].toString().trim(),
        date: row[2].toString().trim(),
        pervClose: row[3].toString().trim(),
        openPrice: row[4].toString().trim(),
        highPrice: row[5].toString().trim(),
        lowPrice: row[6].toString().trim(),
        lastPrice: row[7].toString().trim(),
        closePrice: row[8].toString().trim(),
        avgPrice: row[9].toString().trim(),
        ttlTrdQty: row[10].toString().trim(),
        turnoverLacs: row[11].toString().trim(),
        noOfTrades: row[12].toString().trim(),
        delQty: row[13].toString().trim(),
        delPer: row[14].toString().trim(),
      );

  @override
  fromJson(Map<String, dynamic> json) => ModelOne(
    symbol: json['symbol'],
    series: json['series'],
    date: json['date'],
    pervClose: json['pervClose'],
    openPrice: json['openPrice'],
    highPrice: json['highPrice'],
    lowPrice: json['lowPrice'],
    lastPrice: json['lastPrice'],
    closePrice: json['closePrice'],
    avgPrice: json['avgPrice'],
    ttlTrdQty: json['ttlTrdQty'],
    turnoverLacs: json['turnoverLacs'],
    noOfTrades: json['noOfTrades'],
    delQty: json['delQty'],
    delPer: json['delPer'],
  );

  @override
  Map<String, dynamic> toJson() => {
    'symbol': symbol,
    'series': series,
    'date': date,
    'pervClose': pervClose,
    'openPrice': openPrice,
    'highPrice': highPrice,
    'lowPrice': lowPrice,
    'lastPrice': lastPrice,
    'closePrice': closePrice,
    'avgPrice': avgPrice,
    'ttlTrdQty': ttlTrdQty,
    'turnoverLacs': turnoverLacs,
    'noOfTrades': noOfTrades,
    'delQty': delQty,
    'delPer': delPer,
  };
}
