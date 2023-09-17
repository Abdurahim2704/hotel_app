import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/constants.dart';

class FeatureTile extends StatelessWidget {
  final String icon;
  final String text;

  const FeatureTile({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: CustomColors.listTileColor,
      ),
      child: ListTile(
        leading: icon.endsWith(".png")
            ? Image.asset(icon)
            : SvgPicture.asset(
                icon,
                fit: BoxFit.fitHeight,
              ),
        title: Text(
          text,
          style: CustomStyles.sfProMedium.copyWith(
            color: CustomColors.textBlack,
            fontSize: 16.sp,
          ),
        ),
        subtitle: Text(
          'Самое необходимое',
          style: CustomStyles.sfProMedium.copyWith(
            color: CustomColors.deepGrey,
            fontSize: 14.sp,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          size: 30.sp,
        ),
      ),
    );
  }
}
