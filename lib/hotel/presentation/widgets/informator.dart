import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class Informator extends StatelessWidget {
  final String infoKey;
  final String infoValue;

  const Informator({super.key, required this.infoKey, required this.infoValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            infoKey,
            style: CustomStyles.sfRegular.copyWith(
              color: CustomColors.deepGrey,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(
            width: 203.sp,
            child: Text(
              infoValue,
              softWrap: true,
              style: CustomStyles.sfRegular.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
