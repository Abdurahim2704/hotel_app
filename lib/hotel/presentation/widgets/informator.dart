import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class Informator extends StatelessWidget {
  final String infoKey;
  final String infoValue;
  final Color? valueColor;
  final bool? isFixed;

  const Informator(
      {super.key,
      this.isFixed,
      required this.infoKey,
      required this.infoValue,
      this.valueColor});

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
            softWrap: true,
            style: CustomStyles.sfRegular.copyWith(
              color: CustomColors.deepGrey,
              fontSize: 16.sp,
            ),
          ),
          ClipRRect(
            child: SizedBox(
              width: isFixed == null ? 203.sp : null,
              child: Text(
                infoValue,
                softWrap: true,
                style: CustomStyles.sfRegular.copyWith(
                  color: valueColor ?? Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
