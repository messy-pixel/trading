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
///File Name: filter_tile
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 06/10/23
///
part of '../filtration_import.dart';

class FilterTile extends StatelessWidget {
  final Function(FilterType) onTap;
  final String text;
  final FilterType widgetFilterType;
  final FilterType filterType;

  const FilterTile({
    super.key,
    required this.onTap,
    required this.text,
    required this.filterType,
    required this.widgetFilterType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(filterType),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: context.colorScheme.onSurface.withOpacity(0.1)))),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 5,
                decoration: filterType == widgetFilterType
                    ? BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      )
                    : null,
              ).paddingRight(8.0),
              Text(
                text,
                style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: filterType == widgetFilterType
                        ? FontWeight.w600
                        : FontWeight.w400),
                textAlign: TextAlign.left,
              ).paddingVertical(16.0).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
