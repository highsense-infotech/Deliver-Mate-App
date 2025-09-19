import 'package:delivermate/res/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CommonDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final Stream<List<Map<String, dynamic>>> stream;
  final String fieldName;
  final Function(String?) onChanged;
  final Color? backGroundColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? outlineBorderColor;
  final TextStyle? hintStyle;
  final TextStyle? itemTextStyle;
  final String? Function(String?)? validator;

  const CommonDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.stream,
    required this.fieldName,
    required this.onChanged,
    this.backGroundColor,
    this.enableBorderColor,
    this.focusBorderColor,
    this.outlineBorderColor,
    this.hintStyle,
    this.itemTextStyle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        // if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //   return Text("No data available", style: TextStyle(color: Colors.red));
        // }

        List<Map<String, dynamic>> items = snapshot.data?? [];

        // Remove duplicates by converting to Set and back to List
        List<Map<String, dynamic>> uniqueItems = [];
        Set<String> seenValues = {};

        for (var item in items) {
          String itemValue = item[fieldName]?.toString() ?? "N/A";
          if (!seenValues.contains(itemValue)) {
            seenValues.add(itemValue);
            uniqueItems.add(item);
          }
        }

        // Check if the current value exists in the unique items
        String? validatedValue = value;
        if (value != null && !seenValues.contains(value)) {
          validatedValue = null; // Reset if value doesn't exist in items
        }

        return DropdownButtonFormField<String>(
          isExpanded: true,
          value: validatedValue,
          hint: Text(
            hint,
            style: hintStyle ?? TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          validator: validator,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            filled: true,
            fillColor: backGroundColor ?? AppColors.colorffff,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: outlineBorderColor ?? AppColors.color555555,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: enableBorderColor ?? AppColors.color555555,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: focusBorderColor ?? AppColors.color555555,
                width: 1,
              ),
            ),
          ),
          items: uniqueItems.map((item) {
            return DropdownMenuItem<String>(
              value: item[fieldName]?.toString() ?? "N/A",
              child: Text(
                item[fieldName]?.toString() ?? "N/A",
                style: itemTextStyle ?? TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
          dropdownColor: AppColors.colorffff,
          menuMaxHeight: 300,
          onChanged: onChanged,
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        );
      },
    );
  }
}
