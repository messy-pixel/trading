part 'base_sqlite_model.dart';

part 'select_model.dart';

part 'sqlite_extensions.dart';

part 'sqlite_helper.dart';

part 'schema_model.dart';

abstract interface class BaseSqlite {
  /// Initializes the Sqlite database
  /// - [dataBaseName] : Name of data to the created.
  /// - [versionNo] : version number of the database to be created.
  Future<void> init({required String dataBaseName, required int versionNo});

  /// Create a new table in the database.
  /// - [tableName] : Name of the table to be created.
  /// - [model] : SchemaModel defining the table's column and properties.
  Future createTable({required String tableName, required SchemaModel model});

  /// Delete a table the database.
  /// - [tableName] : Name of the table to be deleted.
  Future deleteTable({required String tableName});

  /// Perform a Select query on the table.
  /// - [tableName] : Name of the table to select data from.
  /// - [where] : Where clause for filtering the selection.
  /// - [whereArgs] : Arguments to replace placeHolder in the Where clause.
  /// - [customWhere] : Custom Where clause (overrides `where` and 'whereArgs')
  Future select(
      {required String tableName,
      String? where,
      String? whereArgs,
      String? customWhere});

  /// Insert data into a table.
  /// - [tableName] : Name of the table to insert data into.
  /// - [data] : Data to be insert as a BaseSqliteModel instance.
  Future insert(
      {required String tableName,
      BaseSqliteModel? data,
      Map<String, dynamic> rowData});

  /// Update data in a table.
  /// - [tableName] : Name of the table to update data in.
  /// - [data] : Data to be updated as a BaseSqliteModel instance.
  /// - [where] : Where clause for filtering the update.
  /// - [whereArgs] : Arguments to replace placeHolder in the Where clause.
  /// - [customWhere] : Custom Where clause for filtering the update (overrides `where` and 'whereArgs')
  Future update(
      {required String tableName,
      required BaseSqliteModel data,
      String? where,
      String? whereArgs,
      String? customWhere});

  /// Delete data from a table.
  /// - [tableName] : Name of the table to delete data from.
  /// - [where] : Where clause for filtering the deletion.
  /// - [whereArgs] : Arguments to replace placeHolder in the Where clause.
  /// - [customWhere] : Custom Where clause (overrides `where` and 'whereArgs')
  Future delete(
      {required String tableName,
      String? where,
      String? whereArgs,
      String? customWhere});

  /// Check if a record with a given primary id exists in the table.
  /// - [where] : Column name of primary id.
  /// - [primaryId] : Value of the primary id to check.
  /// - [tableName] : Name of the table to perform the check on.
  Future<bool> checkIfIdIsPresent(
      {required String where,
      required int primaryId,
      required String tableName});

  /// Perform an upsert (update or insert) operation on the table.
  /// - [tableName] : Name of the table to perform upsert on.
  /// - [data] : Data to be updated/inserted as a BaseSqliteModel instance.
  /// - [where] : Where clause for filtering the update/insert.
  /// - [whereArgs] : Arguments to replace placeHolder in the Where clause.
  /// - [customWhere] : Custom Where clause for filtering the update/insert (overrides `where` and 'whereArgs')
  Future upsert(
      {required String tableName,
      required BaseSqliteModel data,
      String? where,
      String? whereArgs,
      String? customWhere});

  /// Rename a table in the database.
  /// - [tableName] : Current name of the table.
  /// - [newTableName] : New Name of the table.
  Future renameTable({required String tableName, required String newTableName});

  /// Adds new Columns to a table in the database.
  /// - [tableName] : Name of the table to add column to.
  /// - [schema] : SchemaModel defining the new column and their properties.
  Future addColumnInTable(
      {required String tableName, required SchemaModel schema});

  /// Remove Column From a table in the database.
  /// - [tableName] : Name of the table to remove column from.
  /// - [columnName] : Name of the column to be removed.
  Future removeColumnFromTable({required String tableName, String columnName});
}
