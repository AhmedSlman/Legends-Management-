// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:legends_management/core/utils/app_styles.dart';

class ReusableDropDownButton extends StatelessWidget {
  final List items;
  final dynamic selectedItem;
  final String hint;
  final ValueChanged onChanged;
  const ReusableDropDownButton({
    super.key,
    required this.items,
    this.selectedItem,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFF4811),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        value: selectedItem,
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.white,
        hint: Text(
          hint,
          style: AppStyles.styleRegular16(context),
        ),
        style: AppStyles.styleRegular16(context),
        dropdownColor: const Color(0xffFF4811),
        isExpanded: true,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<Object>>((dynamic value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );
  }
}
