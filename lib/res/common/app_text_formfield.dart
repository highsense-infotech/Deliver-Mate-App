// import 'package:diy_exit/res/constant/app_colors.dart';
// import 'package:diy_exit/res/constant/app_textstyle.dart';
// import 'package:flutter/material.dart';

// class AppTextFormField extends StatelessWidget {
//   final bool? obscureText;
//   final Widget? suffixIcon;
//   final String? labelText;
//   final String? hintText;
//   final TextInputAction? textInputAction;
//   final TextInputType? keyboardType;
//   final String? Function(String?)? validator;
//   final TextEditingController? controller;
//   const AppTextFormField({
//     Key? key,
//     this.controller,
//     this.labelText,
//     this.validator,
//     this.obscureText,
//     this.suffixIcon,
//     this.hintText,
//     this.keyboardType,
//     this.textInputAction,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 13),
//       child: TextFormField(
//         obscureText: obscureText ?? false,
//         controller: controller,
//         cursorColor: AppColors.colorC8281E,

//         autofocus: true,
//         keyboardType: keyboardType,
//         textInputAction: textInputAction ?? TextInputAction.next,
//         decoration: InputDecoration(
//           suffixIcon: suffixIcon ?? const SizedBox(),
//           hintText: hintText!,
//           hintStyle: textStyle14.copyWith(
//             fontWeight: FontWeight.w400,
//             color: AppColors.color989797,
//           ),
//           filled: true,
//           fillColor: AppColors.colorffff,
//           labelText: labelText ?? "Email",

//           contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.color555555),
//             borderRadius: BorderRadius.all(Radius.circular(6)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.color555555),
//             borderRadius: BorderRadius.all(Radius.circular(6)),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: AppColors.redColor),
//             borderRadius: BorderRadius.all(Radius.circular(6)),
//           ),
//         ),

//         validator: validator,
//       ),
//     );
//   }
// }

import 'package:delivermate/res/constant/app_colors.dart';
import 'package:delivermate/res/constant/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;

class AppTextFormField extends StatelessWidget {
  final bool? obscureText;
  final bool? isCapitalFirstLeter ;
  final Widget? suffixIcon;
  final String? labelText;
  final Color? bgColor;
  final String? hintText;
  final Color? hintTextColor;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? readOnly;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  // final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? padding;
  final bool enableSpeech; // <--- NEW
  final VoidCallback? onMicTap; // <--- NEW
  final bool? isListening;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final TextStyle? hintStyle;

   const AppTextFormField({
    super.key,
    this.controller,
    this.maxLines,
    this.labelText,
    this.validator,
    this.obscureText,
    this.isCapitalFirstLeter = true,
     this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.initialValue,
    this.readOnly,
    this.bgColor,
    this.hintTextColor,
    this.prefixIcon,
    // this.focusNode,
    this.onChanged,
    this.padding,
    this.enableSpeech = false,
    this.onMicTap,
    this.isListening,
    this.maxLength,
    this.inputFormatters,
    this.onTap, this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("is listening$isListening");
    return Padding(
      padding:
          padding ??
          EdgeInsets.only(top: Get.height * 0.001, bottom: Get.height * 0.01),
      child: TextFormField(
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        controller: controller,
        // focusNode: focusNode,

        autofocus: false,
        onTap: onTap,
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        style: const TextStyle(
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters ??
            (keyboardType == TextInputType.phone
                ? [FilteringTextInputFormatter.digitsOnly]
                : null),
        cursorColor: AppColors.colorC8281E,
        textInputAction: textInputAction ?? TextInputAction.next,
        // textCapitalization: textCapitalization ??
        //     isCapitalFirstLeter == false
        //         ? TextCapitalization.none
        //         : TextCapitalization.words,
        textCapitalization: textCapitalization != TextCapitalization.none
            ? textCapitalization
            : (isCapitalFirstLeter == false
            ? TextCapitalization.none
            : TextCapitalization.words),


        maxLength: maxLength,
        decoration: InputDecoration(
          border: InputBorder.none,
          alignLabelWithHint: true,
          prefixIcon: prefixIcon,
          counterText: "",
          suffixIcon:
              enableSpeech
                  ? IconButton(
                    icon: Icon(
                      Icons.mic,
                      color:
                          isListening == true
                              ? Colors.red
                              : Colors.grey,
                    ),
                    onPressed: onMicTap,
                  )
                  : suffixIcon ?? const SizedBox(),

          hintText: hintText,
          hintStyle: hintStyle??TextStyle(
            color: hintTextColor ?? Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

          filled: true,
          fillColor: bgColor ?? AppColors.colorffff,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.color555555),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.color555555),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.color555555),
            borderRadius: const BorderRadius.all(Radius.circular(6)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.redColor),
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextAlign textAlign;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Color? bgColor;
  final bool? readOnly;
  final bool? enabled;
  final double? fontSize;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final int? maxLines; // Add this parameter
  final int? minLines;
  final void Function()? onTap;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.keyboardType,
    this.padding,
    this.bgColor,
    this.readOnly, this.enabled, this.fontSize,this.hintStyle, this.focusNode, this.onTap, this.maxLines, this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: 0),
      child: TextField(
        // focusNode: focusNode,
        enabled: enabled,
        readOnly: readOnly ?? false,
        controller: controller,
        keyboardType: keyboardType,
        textAlign: textAlign,
        style: textStyle10.copyWith(
          fontWeight: FontWeight.w400,
          color: AppColors.color1E1E1E,
          fontSize: fontSize,
        ),
        maxLines: maxLines,
        minLines: minLines,
        cursorColor: AppColors.colorC8281E,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? textStyle10.copyWith(color: Colors.grey),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          filled: true,
          fillColor: bgColor ?? AppColors.colorffff,
          border: InputBorder.none,

        ),
        onTap: onTap,
      ),
    );
  }
}
