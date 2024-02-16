import 'package:flutter_common_utils/utility/local_database/base_sqlite.dart';

import '../../consts/consts.dart';

class TableSchema {
  /// Table schema for the table one.
  static SchemaModel finalDataSet = SchemaModel(dbColumnList: [
    DbColumn(
      columnName: DbConsts.id,
      dataAttributes: [DbDataAttr.primaryKey, DbDataAttr.autoIncrement],
      datatype: DbDataType.integer,
    ),
    DbColumn(columnName: DbConsts.symbol, datatype: DbDataType.text),
    DbColumn(columnName: DbConsts.instrument, datatype: DbDataType.text),
    DbColumn(columnName: DbConsts.timestamp, datatype: DbDataType.text),
    DbColumn(columnName: DbConsts.previousPrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.openPrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.openInterest, datatype: DbDataType.real),
    DbColumn(
        columnName: DbConsts.changeInOpenInterest, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.ceOI, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.ceCIOI, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.peOI, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.peCIOI, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.highPrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.lowPrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.closePrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.averagePrice, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.ttlTrdQty, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.deliveryQuantity, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.fiftyTwoWeekHigh, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.fiftyTwoWeekLow, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.futureOIPer, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.pricePer, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.pCR, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.c2Support, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.c2Resistance, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.c2High, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.c2Low, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.volumeFactor, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.deliveryFactor, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.support1, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.support2, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.resistance1, datatype: DbDataType.real),
    DbColumn(columnName: DbConsts.resistance2, datatype: DbDataType.real),
  ]);
}
