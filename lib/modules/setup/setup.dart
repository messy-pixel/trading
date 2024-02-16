import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';

import '../../utils/route_generator.dart';
import 'setup_cubit/setup_cubit.dart';

class Setup extends StatefulWidget {
  const Setup({super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  /// The setup cubit.  
  late final SetupCubit cubit;

  @override
  void initState() {
    cubit = SetupCubit();
    // Configuring device orientation.
    cubit.setDeviceOrientation();
    // Setup the local database.
    cubit.setupDatabase();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Configuring the device size to be used later.
    cubit.deviceSizeConfig(context);
    return BlocConsumer(
      bloc: cubit,
      listener: (context, state) {
        if (state is SetupDone) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ConstRoutes.homeScreen,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is SettingUp) {
          return const CircularProgressIndicator().center();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
