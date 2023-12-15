part of 'base_sqlite.dart';

/// Enum to represent the [DataType] supported in the [Database].
enum DbDataType { integer, real, text, timestamp, blob }

/// Enum to represent [AdditionalAttributes] for [DatabaseColumn].
enum DbDataAttr { primaryKey, autoIncrement, notNull }

// Model class for [DatabaseSchema].
class SchemaModel {
  // List of DbColumn that make up the database schema.
  final List<DbColumn> dbColumnList;

  SchemaModel({required this.dbColumnList});

  // Sql query string that will be generate base on the DbColumns.
  String sqlQuery = '';

  // Method to generate the Sql query for create the table.
  String getSqlQuery() {
    for (int i = 0; i < dbColumnList.length; i++) {
      // Generate the column query and append it to the Sql query string.
      sqlQuery += dbColumnList[i].getColumnQuery();
      if (i < dbColumnList.length - 1) sqlQuery += ', ';
    }
    return sqlQuery;
  }
}

class DbColumn {
  // Name of the column.
  final String columnName;

  // Data type of the column (default is DbDataType.integer)
  final DbDataType dataType;

  // List of additional data attributes for the column (optional).
  final List<DbDataAttr>? dataAttributes;

  // Default value for the column (optional).
  final String? defValue;

  /// Constructor for DbColumn.
  DbColumn({
    required this.columnName,
    this.dataType = DbDataType.integer,
    this.dataAttributes,
    this.defValue,
  });

  /// Method to generate the column query for the Sql table creation statement.
  String getColumnQuery() {
    // Generate the 'default' part of the column query base on the defValue.
    String def = defValue == null ? ' ' : 'default $defValue';

    // Generate the full column query seting with data type and attribute (if any).
    return '$columnName ${dataType.name}$def${dataAttributes?.map((e) => e.getAttr()).join(' ') ?? ''}';
  }
}
