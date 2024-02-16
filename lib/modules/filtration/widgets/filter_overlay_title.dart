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
///File Name: filter_overlay_title
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/11/23
///

part of '../filtration_import.dart';

/// [FilterTitleReset] contains title for filter by
///  and reset text button for the bottom sheet for mobile devices.
class FilterTitleReset extends StatelessWidget {
  final VoidCallback onReset;

  const FilterTitleReset({
    super.key,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: context.colorScheme.onSurface.withOpacity(0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // [FilterBy] title
          Text(
            StringC.filterBy,
            style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.inverseSurface,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          // [Reset] button
          // to reset all the filters.
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onReset();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  IconConsts.refresh,
                  color: context.colorScheme.primary,
                ),
                8.sizedWidthBox,
                Text(
                  StringC.reset,
                  style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.primary),
                )
              ],
            ),
          )
        ],
      ).paddingHorizontal(16.0),
    );
  }
}
