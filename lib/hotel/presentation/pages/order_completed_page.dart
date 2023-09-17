import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/hotel/presentation/bloc/hotel_bloc/hotel_bloc.dart';

import '../../../core/constants/constants.dart';
import '../widgets/widgets.dart';

class OrderCompleted extends StatelessWidget {
  const OrderCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text('Отель',
            style: CustomStyles.sfProMedium.copyWith(fontSize: 18.sp)),
      ),
      body: Align(
        alignment: FractionalOffset(0.5, 0.4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100.sp,
              width: 100.sp,
              decoration: BoxDecoration(
                  color: CustomColors.backgroundColor, shape: BoxShape.circle),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(25.sp),
                  child: Image.asset(
                    CustomImages.partyPopper,
                    height: 100.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 32.sp,
            ),
            Text(
              'Ваш заказ принят в работу',
              textAlign: TextAlign.center,
              style: CustomStyles.sfProMedium.copyWith(
                color: Colors.black,
                fontSize: 22.sp,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.sp),
              child: Text(
                'Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                textAlign: TextAlign.center,
                softWrap: true,
                style: CustomStyles.sfRegular.copyWith(
                  color: CustomColors.deepGrey,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 28.sp),
        color: Colors.white,
        child: BlueButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              "/",
              (route) => false,
            );
            context.read<HotelBloc>().add(GetHotelEvent());
          },
          text: 'Супер!',
        ),
      ),
    );
  }
}
