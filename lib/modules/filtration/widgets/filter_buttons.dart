///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2023] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: filter_buttons
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/11/23
///
part of '../filtration_import.dart';

/// [FilterButtons] contains buttons for
/// [ShowResults] button and
/// [Reset] button for tablet tablet.
class FilterButtons extends StatelessWidget {
  const FilterButtons({
    super.key,
    required this.filtrationCubit,
    required this.onReset,
  });

  final VoidCallback onReset;
  final FilterationCubit filtrationCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // [ShowResults] buttons
        // that pops the filter overlay and confirms all the filters.
        BlocBuilder(
          bloc: filtrationCubit,
          builder: (context, FilteredListState state) {
            return OutlinedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      ColorConsts.lightBlue.withOpacity(0.5))),
              onPressed: () => Navigator.pop(context),
              child: Text(
                StringC.showResults(state.data.length),
                // StringC.showResults,
                style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        ).expand(flex: 2)
      ],
    ).paddingOnly(top: 16).paddingHorizontal16();
  }
}
