import 'package:flutter_common_utils/utility/local_database/base_sqlite.dart';

part 'model_one.dart';

part 'model_three.dart';

part 'model_two.dart';

part 'filters_dm.dart';

part 'final_data_model.dart';

abstract interface class CsvConvertible<T> {
  T fromCsv(List<dynamic> row);

  int noOfParameters();
}
