part of 'models.dart';

class ModelOne extends CsvConvertible<ModelOne> {
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
        symbol: row[0],
        series: row[1],
        date: row[2],
        pervClose: row[3],
        openPrice: row[4],
        highPrice: row[5],
        lowPrice: row[6],
        lastPrice: row[7],
        closePrice: row[8],
        avgPrice: row[9],
        ttlTrdQty: row[10],
        turnoverLacs: row[11],
        noOfTrades: row[12],
        delQty: row[13],
        delPer: row[14],
      );
}
