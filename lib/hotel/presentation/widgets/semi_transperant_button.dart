import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SemiTransperantButton extends StatelessWidget {
  final Widget child;
  final Color buttonColor;

  const SemiTransperantButton(
      {super.key, required this.child, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(7.sp),
          ),
          color: buttonColor,
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
