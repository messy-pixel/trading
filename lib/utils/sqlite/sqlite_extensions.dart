part of 'base_sqlite.dart';

/// Extension for the [DbDataAttr] enum to provide [getAttr] method.
extension DbDataAttrEx on DbDataAttr {
  /// Method to get the attribute String representation for each DbDataAttr value.
  getAttr() {
    switch (this) {
      case DbDataAttr.primaryKey:
        // If the enum value is primaryKey, return 'primary key'.
        return 'primary key';
      case DbDataAttr.autoIncrement:
        // If the enum value is autoIncrement, return 'autoincrement'.
        return 'autoincrement';
      case DbDataAttr.notNull:
        // If the enum value is not null, return 'not null'.
        return 'not null';
    }
  }
}
