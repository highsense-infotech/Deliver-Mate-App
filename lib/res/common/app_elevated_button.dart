import 'package:delivermate/res/constant/app_colors.dart';
import 'package:flutter/material.dart';

import '../constant/app_textstyle.dart' show textStyle18;



class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.txtColor,
    this.borderRadius,
    this.height,
    this.width,
    this.hoverColor,
    required this.text,
    required this.onPressed,
    this.fontSize,
    this.textStyle,
    this.bgColor,
    this.icon,
    this.borderColor,
    this.loaderValue = false,
    this.decoration,
  });

  final Color? txtColor;
  final Color? hoverColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final String text;
  final double? fontSize;
  final Color? bgColor;
  final Color? borderColor;
  final IconData? icon;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final bool loaderValue; // Defaulted to non-nullable
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loaderValue ? null : onPressed,
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        decoration:
            decoration ??
            BoxDecoration(
              color: bgColor??AppColors.colorC8281E,
              border: Border.all(color: borderColor ?? Colors.transparent),
              borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
            ),
        child: Center(
          child:
              loaderValue
                  ? SizedBox(
                    height: 24, // Define size to match button UI
                    width: 24,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        txtColor ?? Colors.white,
                      ),
                      strokeWidth: 2.5,
                    ),
                  )
                  : icon == null
                  ? Text(
                    text,
                    style:
                        textStyle ??
                        textStyle18.copyWith(
                          color: txtColor ?? AppColors.colorffff,
                        ),
                  )
                  : Icon(
                    icon,
                    color: txtColor ?? AppColors.colorffff,
                    size: 20,
                  ),
        ),
      ),
    );
  }
}
