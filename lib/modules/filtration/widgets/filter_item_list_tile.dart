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
///File Name: filter_item_list_tile
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 03/11/23
///

part of '../filtration_import.dart';

/// [FilterItermListTile] contains the widget for the single FilterItem,
/// which will be used in the [FilterItemsList].
/// And [FilterItemsList] will make a list of it
/// having different Filter items for the single filter.
class FilterItermListTile extends StatelessWidget {
  final bool? isSelected;
  final String text;
  final VoidCallback onTap;
  final bool sorting;
  final bool ascending;
  final String? dateRange;

  const FilterItermListTile(
      {super.key,
      this.dateRange,
      this.isSelected = false,
      this.sorting = false,
      this.ascending = false,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: context.colorScheme.onSurface.withOpacity(0.1)))),
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          children: [
            Row(
              children: [
                // Check Icon,
                // blue if following is selected grey if not.
                Icon(Icons.check,
                        // height: 24,
                        color: (isSelected ?? false)
                            ? context.colorScheme.primary
                            : context.colorScheme.onSurface.withOpacity(0.1))
                    .paddingHorizontal8(),

                // Title of the filter item.
                Text(
                  maxLines: 3,
                  text,
                  style: context.textTheme.labelLarge?.copyWith(
                      fontWeight: (isSelected ?? false)
                          ? FontWeight.w600
                          : FontWeight.w400),
                ).expand(),

                // Acending and Descending icons for the sort by filter.
                if ((isSelected ?? false) && sorting)
                  Icon(
                    ascending ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    color: context.colorScheme.primary,
                    // height: 20,
                  ).paddingRight(12)
              ],
            ).paddingOnly(top: 14.0, bottom: 14.0),

            // Widgets to show the custom date range selected by the user.
            // if ((isSelected ?? false) && text == StringConsts.customDate)
            //   DateRangeWidget(dateRange: dateRange ?? '~')
          ],
        ),
      ),
    );
  }
}

/// [DateRangeWidget] consists Widget for showing
/// the date range selected by the user in the filter pop
/// below the custom dates filter title.
// class DateRangeWidget extends StatelessWidget {
//   const DateRangeWidget({super.key, required this.dateRange});
//
//   final String dateRange;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         FromToDateWidget(dateRange: dateRange, index: 0),
//         8.sizedWidthBox,
//         FromToDateWidget(dateRange: dateRange, index: 1),
//       ],
//     ).paddingSymmetric(vertical: 8, horizontal: 16);
//   }
// }

/// [FromToDateWidget] consists Widget to show
/// a single date range from date range select by user.
// class FromToDateWidget extends StatelessWidget {
//   const FromToDateWidget(
//       {super.key, required this.dateRange, required this.index});
//
//   final int index;
//   final String dateRange;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         BaseText(
//           index == 0 ? StringConsts.from : StringConsts.to,
//           style: context.textTheme.titleSmall?.copyWith(fontSize: 12),
//         ),
//         Card(
//           color: context.colorScheme.onPrimary,
//           child: Row(
//             children: [
//               Image.asset(
//                 AssetConsts.calenderCheck,
//                 height: 20,
//               ),
//               // 2.sizedWidthBox,
//               BaseText(
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//                 style: context.textTheme.labelMedium
//                     ?.copyWith(fontWeight: FontWeight.bold),
//                 dateRange.split('~')[index],
//               ).expand(),
//             ],
//           ).paddingSymmetric(vertical: 12, horizontal: 8),
//         )
//       ],
//     ).expand();
//   }
// }
