part of 'base_sqlite.dart';

/// [BaseSqliteSelectModel] representing a base Sqlite Select operation.
class BaseSqliteSelectModel {

  /// The name of the table of query.
  final String tableName;

  /// Optional Where clause for filtering results.
  final String? where;

  /// Optional arguments for parameterized Where clause.
  final Object? whereArgs;

  BaseSqliteSelectModel({required this.tableName, this.where, this.whereArgs});
}
