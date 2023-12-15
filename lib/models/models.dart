part 'model_one.dart';

part 'model_two.dart';

abstract interface class CsvConvertible<T> {
  T fromCsv(List<dynamic> row);

  int noOfParameters();
}
