part of 'models.dart';

class ModelThree implements CsvConvertible<ModelThree>, BaseSqliteModel {
  final String? instrument;
  final String? symbol;
  final String? expiryot;
  final String? strikePr;
  final String? optionTyp;
  final String? open;
  final String? high;
  final String? low;
  final String? close;
  final String? settlePr;
  final String? contracts;
  final String? valInLakh;
  final String? openint;
  final String? chgin01;
  final String? timestamp;

  ModelThree({
    this.instrument,
    this.symbol,
    this.expiryot,
    this.strikePr,
    this.optionTyp,
    this.open,
    this.high,
    this.low,
    this.close,
    this.settlePr,
    this.contracts,
    this.valInLakh,
    this.openint,
    this.chgin01,
    this.timestamp,
  });

  @override
  int noOfParameters() => [
        instrument,
        symbol,
        expiryot,
        strikePr,
        optionTyp,
        open,
        high,
        low,
        close,
        settlePr,
        contracts,
        valInLakh,
        openint,
        chgin01,
        timestamp,
      ].where((e) => e == null).length;

  @override
  fromCsv(List<dynamic> row) => ModelThree(
        instrument: row[0].toString().trim(),
        symbol: row[1].toString().trim(),
        expiryot: row[2].toString().trim(),
        strikePr: row[3].toString().trim(),
        optionTyp: row[4].toString().trim(),
        open: row[5].toString().trim(),
        high: row[6].toString().trim(),
        low: row[7].toString().trim(),
        close: row[8].toString().trim(),
        settlePr: row[9].toString().trim(),
        contracts: row[10].toString().trim(),
        valInLakh: row[11].toString().trim(),
        openint: row[12].toString().trim(),
        chgin01: row[13].toString().trim(),
        timestamp: row[14].toString().trim(),
      );

  @override
  fromJson(Map<String, dynamic> json) => ModelThree(
        instrument: json['instrument'],
        symbol: json['symbol'],
        expiryot: json['expiryot'],
        strikePr: json['strikePr'],
        optionTyp: json['optionTyp'],
        open: json['open'],
        high: json['high'],
        low: json['low'],
        close: json['close'],
        settlePr: json['settlePr'],
        contracts: json['contracts'],
        valInLakh: json['valInLakh'],
        openint: json['openint'],
        chgin01: json['chgin01'],
        timestamp: json['timestamp'],
      );

  @override
  Map<String, dynamic> toJson() => {
        'instrument': instrument,
        'symbol': symbol,
        'expiryot': expiryot,
        'strikePr': strikePr,
        'optionTyp': optionTyp,
        'open': open,
        'high': high,
        'low': low,
        'close': close,
        'settlePr': settlePr,
        'contracts': contracts,
        'valInLakh': valInLakh,
        'openint': openint,
        'chgin01': chgin01,
        'timestamp': timestamp,
      };
}
