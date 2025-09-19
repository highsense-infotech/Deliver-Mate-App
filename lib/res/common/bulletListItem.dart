import 'package:delivermate/res/constant/app_colors.dart';
import 'package:delivermate/res/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class BulletListItem extends StatelessWidget {
  final String text;

  const BulletListItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle_outlined, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: textStyle10.copyWith(color: AppColors.color1E1E1E),
            ),
          ),
        ],
      ),
    );
  }
}
