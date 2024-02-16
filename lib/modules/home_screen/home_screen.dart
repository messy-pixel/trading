import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempt/consts/icon_consts.dart';
import 'package:tempt/modules/home_screen/widget/home_content.dart';
import 'package:tempt/modules/home_screen/widget/loading.dart';
import 'package:tempt/utils/utils.dart';

import 'cubit/fetch_data_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Cubit to fetch data from the severs
  /// and saving and retrieving from local database.
  late final FetchDataCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = FetchDataCubit();
    _cubit.logic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Stocks Wizard'),
          actions: [
            if (_cubit.localData.isEmpty)
              IconButton(
                onPressed: _onRefreshTap,
                icon: IconConsts.getIcon(
                  icon: IconConsts.refresh,
                  color: context.colorScheme.primary,
                ),
              )
          ],
        ),
        body: BlocConsumer(
          bloc: _cubit,
          builder: (context, state) {
            switch (state.runtimeType) {
              case LoadingData:
                return const LoadingW(lEnum: LoadingEnum.loadingData);
              case FinalDataState:
                return HomeContent(
                    dataSets: (state as FinalDataState).finalDataSet);
              default:
                return const SizedBox.shrink();
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  void _onRefreshTap() => _cubit.logic();
}
