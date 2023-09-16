import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextInputFormatter? formatter;
  final String labelText;
  final String? prefixText;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.formatter,
      this.prefixText,
      required this.labelText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
      child: TextFormField(
        validator: validator,
        inputFormatters: [if (formatter != null) formatter!],
        style: CustomStyles.sfRegular.copyWith(
          color: CustomColors.textFieldTextColor,
          fontSize: 16.sp,
          letterSpacing: 0.75,
        ),
        autocorrect: false,
        cursorColor: CustomColors.textFieldTextColor,
        cursorHeight: 17.sp,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColors.textFieldFillColor,
          border: InputBorder.none,
          prefixText: prefixText,
          prefixStyle: CustomStyles.sfRegular.copyWith(
            color: CustomColors.textFieldTextColor,
            fontSize: 16.sp,
            letterSpacing: 0.75,
          ),
          labelText: labelText,
          labelStyle: CustomStyles.sfRegular.copyWith(
            color: CustomColors.helpTextColor,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
