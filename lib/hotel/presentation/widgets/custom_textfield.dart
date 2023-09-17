import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/hotel/data/models/models.dart';
import 'package:hotel_app/hotel/presentation/bloc/order_bloc/order_bloc.dart';

import '../../../core/constants/constants.dart';

class CustomTextField extends StatefulWidget {
  final TextInputFormatter? formatter;
  final String labelText;
  final String? prefixText;
  final bool Function(String)? validator;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.formatter,
    this.prefixText,
    required this.labelText,
    this.validator,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
      child: TextFormField(
        onChanged: (value) {
          if (widget.validator != null) {
            isValid = widget.validator!.call(value);
          } else {
            isValid = value.isNotEmpty;
          }
          setState(() {});
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Hеобходимо заполнить данные";
          }
          if (widget.validator != null) {
            if (!widget.validator!.call(value)) {
              return "Please input correct value";
            }
          }
          return null;
        },
        inputFormatters: [if (widget.formatter != null) widget.formatter!],
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
          border: InputBorder.none,
          errorText: isValid
              ? null
              : widget.errorText ?? "Hеобходимо заполнить данные",
          fillColor: isValid &&
                  context.watch<OrderBloc>().state.status ==
                      ValidationStatus.valid
              ? CustomColors.textFieldFillColor
              : CustomColors.errorTextFieldColor,
          prefixText: widget.prefixText,
          prefixStyle: CustomStyles.sfRegular.copyWith(
            color: CustomColors.textFieldTextColor,
            fontSize: 16.sp,
            letterSpacing: 0.75,
          ),
          labelText: widget.labelText,
          labelStyle: CustomStyles.sfRegular.copyWith(
            color: CustomColors.helpTextColor,
            fontSize: 17.sp,
          ),
        ),
      ),
    );
  }
}
