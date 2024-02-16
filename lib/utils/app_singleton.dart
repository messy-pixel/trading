part of 'utils.dart';

class AppSingleton {
  /// Singleton pattern.
  static final AppSingleton _appSingleton = AppSingleton._internal();

  factory AppSingleton() => _appSingleton;

  AppSingleton._internal();

  BaseSqlite sqLite = BaseSqlite();

  double deviceWidth = 1.0;
  double deviceHeight = 1.0;
  bool isMobile = true;
}
