import 'package:delivermate/res/constant/app_colors.dart';
import 'package:delivermate/res/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.circle, color: AppColors.color555555, size: 6),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: textStyle12.copyWith(color: AppColors.color555555),
          ),
        ),
      ],
    );
  }
}
