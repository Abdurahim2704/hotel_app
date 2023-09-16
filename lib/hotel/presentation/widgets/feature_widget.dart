import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/constants/constants.dart';

class FeaturesWidget extends StatelessWidget {
  final String text;

  const FeaturesWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.sp),
      margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 4.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.sp)),
          color: CustomColors.lightGrey),
      child: Text(
        text,
        style: TextStyle(
          color: CustomColors.deepGrey,
          fontSize: 16,
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
