// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../consts/consts.dart';
import '../../../utils/local_db/table_schema.dart';
import '../../../utils/utils.dart';

part 'setup_state.dart';

class SetupCubit extends Cubit<SetupState> {
  SetupCubit() : super(SetupInitial());

  /// Create the local database and the required tables.
  void setupDatabase() async {
    emit(SettingUp());
    // Initialize the database.
    await AppSingleton().sqLite.init(
          dataBaseName: 'db',
          versionNumber: 1,
        );
    // Create the final table.
    await AppSingleton().sqLite.createTable(
          tableName: DbConsts.finalDataSet,
          model: TableSchema.finalDataSet,
        );
    emit(SetupDone());
  }

  /// Configuring device orientation.
  void setDeviceOrientation() => SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /// Configure device size.
  void deviceSizeConfig(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    Orientation orientation = mediaQueryData.orientation;

    AppSingleton().deviceWidth = mediaQueryData.size.width;
    AppSingleton().deviceHeight = mediaQueryData.size.height;

    double deviceWidth = 0;
    if (orientation == Orientation.landscape) {
      deviceWidth = mediaQueryData.size.height;
    } else {
      deviceWidth = mediaQueryData.size.width;
    }

    // If the device's width is greater than 600.
    if (deviceWidth > 600) {
      // device is tablet.
      AppSingleton().isMobile = false;
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    // Device's width is less than 600.
    else {
      // device is mobile.
      AppSingleton().isMobile = true;
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }
}
