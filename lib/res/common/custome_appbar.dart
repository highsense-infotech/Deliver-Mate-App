import 'package:delivermate/res/constant/app_colors.dart';
import 'package:delivermate/res/constant/app_images.dart';
import 'package:delivermate/res/constant/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget commonAppBar(
  String title, {
  List<Widget>? actions,
  Widget? leading,
  void Function()? onTap,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight),
    child: AppBar(
      flexibleSpace: Container(),
      title: Text(title, style: textStyle16),
      elevation: 0.0,
      scrolledUnderElevation: 0,
      leading:
          leading ??
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: onTap??() => Get.back(),
                child: Icon(Icons.navigate_before, color: AppColors.colorffff),
              );
            },
          ),
      actionsPadding: EdgeInsets.only(right: 20),
      actions:
          actions ??
          [
            GestureDetector(
              onTap: () {},
              child: Image.asset(AppIcons.homeIcon, height: 20),
            ),
          ],
    ),
  );
}
