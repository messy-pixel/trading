part of 'models.dart';

class ModelTwo extends CsvConvertible<ModelTwo> {
  final String? symbol;
  final String? series;
  final String? adjusted52WeekHigh;
  final String? weekHighDate;
  final String? adjusted52WeekLow;
  final String? weekLowDate;

  ModelTwo({
    this.symbol,
    this.series,
    this.adjusted52WeekHigh,
    this.weekHighDate,
    this.adjusted52WeekLow,
    this.weekLowDate,
  });

  @override
  int noOfParameters() => [
        symbol,
        series,
        adjusted52WeekHigh,
        weekHighDate,
        adjusted52WeekLow,
        weekLowDate,
      ].where((e) => e == null).length;

  @override
  fromCsv(List<dynamic> row) => ModelTwo(
        symbol: row[0],
        series: row[1],
        adjusted52WeekHigh: row[2],
        weekHighDate: row[3],
        adjusted52WeekLow: row[4],
        weekLowDate: row[5],
      );
}
