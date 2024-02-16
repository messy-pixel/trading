part of 'models.dart';

class ModelTwo implements CsvConvertible<ModelTwo>, BaseSqliteModel {
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
        symbol: row[0].toString().trim(),
        series: row[1].toString().trim(),
        adjusted52WeekHigh: row[2].toString().trim(),
        weekHighDate: row[3].toString().trim(),
        adjusted52WeekLow: row[4].toString().trim(),
        weekLowDate: row[5].toString().trim(),
      );

  @override
  fromJson(Map<String, dynamic> json) => ModelTwo(
        symbol: json['symbol'],
        series: json['series'],
        adjusted52WeekHigh: json['adjusted52WeekHigh'],
        weekHighDate: json['weekHighDate'],
        adjusted52WeekLow: json['adjusted52WeekLow'],
        weekLowDate: json['weekLowDate'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'symbol': symbol,
        'series': series,
        'adjusted52WeekHigh': adjusted52WeekHigh,
        'weekHighDate': weekHighDate,
        'adjusted52WeekLow': adjusted52WeekLow,
        'weekLowDate': weekLowDate,
      };
}
