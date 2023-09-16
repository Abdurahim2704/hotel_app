import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class BlueButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const BlueButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MaterialButton(
        onPressed: onPressed,
        color: CustomColors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        padding: EdgeInsets.symmetric(vertical: 13),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
