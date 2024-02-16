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
///File Name: delivery_search_field
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 11.0.7
///@since 13/09/23
///

part of '../filtration_import.dart';

/// [SearchField] has the TextField for
/// the Delivery Searching.
/// it can search for deliveries with matching data
class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.onChange,
      required this.controller,
      required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      focusNode: focusNode,
      controller: controller,
      onFieldSubmitted: onChange,
      decoration: InputDecoration(
        hintText: StringC.searchHere,
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller.text = StringC.emptyString;
                  onChange(StringC.emptyString);
                },
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
    );
  }
}
