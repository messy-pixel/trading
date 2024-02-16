import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempt/consts/icon_consts.dart';
import 'package:tempt/modules/home/widget/home_content.dart';
import 'package:tempt/modules/home/widget/loading.dart';
import 'package:tempt/utils/utils.dart';

import 'cubit/home_cubit.dart';

export 'widget/home_content.dart';
export 'widget/loading.dart';
export 'widget/stock_tile.dart';
export 'cubit/home_cubit.dart';

/// [Home] is the main page of the application.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  /// Callback when the refers icon is clicked.
  void _onRefreshTap() => _cubit.logic();
}
