part of 'base_sqlite.dart';

/// Abstract [BaseSqliteModel class defining a base model for Sqlite data entities.
abstract class BaseSqliteModel {

  /// Abstract method to covert the model to a Json representation.
  /// This method should be implemented in the subclasses to serialize the model to Json.
  dynamic toJson();

  /// Abstract method to create a model instance from a Json representation.
  /// This method should be implemented in subclasses to deserialize the model from Json
  dynamic fromJson(Map<String, dynamic> json);
}