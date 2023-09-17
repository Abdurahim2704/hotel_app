import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/textinputformatters.dart';
import '../bloc/order_bloc/order_bloc.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final controller = ExpansionTileController();
  int addTourCount = 0;
  final formkey = GlobalKey<FormState>();

  Widget _additionalTourist(int number) {
    return WhiteContainer(
      child: ExpansionTileWidget(
          text: "${number + 2} турист", children: _defaultForm),
    );
  }

  List<Widget> get _defaultForm {
    return [
      const CustomTextField(labelText: 'Имя'),
      SizedBox(
        height: 10.sp,
      ),
      const CustomTextField(labelText: 'Фамилия'),
      SizedBox(
        height: 10.sp,
      ),
      const CustomTextField(labelText: 'Дата рождения'),
      SizedBox(
        height: 10.sp,
      ),
      const CustomTextField(labelText: 'Гражданство'),
      SizedBox(
        height: 10.sp,
      ),
      const CustomTextField(labelText: 'Номер загранпаспорта'),
      SizedBox(
        height: 10.sp,
      ),
      const CustomTextField(labelText: 'Срок действия загранпаспорта'),
      SizedBox(
        height: 10.sp,
      ),
    ];
  }

  String formattedPrice(num price) {
    String priceStr = price.toString();
    String formattedPrice = "";

    for (int i = 0; i < priceStr.length; i++) {
      formattedPrice += priceStr[i];
      if ((priceStr.length - i - 1) % 3 == 0 && i != priceStr.length - 1) {
        formattedPrice += " ";
      }
    }

    return "$formattedPrice ₽";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading || state is OrderInitial) {
          return const LoadingPage();
        }
        final order = context.watch<OrderBloc>().state.order!;

        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Отель',
              style: CustomStyles.sfProMedium.copyWith(fontSize: 18.sp),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  WhiteContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Rating widget
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: SemiTransperantButton(
                              buttonColor: CustomColors.lightOrange,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: CustomColors.deepOrange,
                                  ),
                                  Text(
                                    "${order.horating} ${order.ratingName}",
                                    style: CustomStyles.sfProMedium.copyWith(
                                        color: CustomColors.deepOrange,
                                        fontSize: 16.sp),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),

                        ///Name
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Text(
                            order.hotelName,
                            style: CustomStyles.sfProMedium.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),

                        ///Location
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Text(
                            order.hotelAdress,
                            style: CustomStyles.sfProMedium.copyWith(
                              color: CustomColors.blue,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),

                  ///Registration
                  WhiteContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _defaultForm,
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),

                  ///Information about client
                  WhiteContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Информация о покупателе',
                          style: CustomStyles.sfProMedium.copyWith(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Column(
                          children: [
                            CustomTextField(
                              formatter:
                                  TextInputFormatters.phoneNumberFormatter,
                              labelText: 'Номер телефона',
                              prefixText: "+7 ",
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            CustomTextField(
                              validator: RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                  .hasMatch,
                              formatter:
                                  TextInputFormatters.emailFormatterRegEx,
                              labelText: 'Почта',
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Text(
                              'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                              style: CustomStyles.sfRegular.copyWith(
                                color: CustomColors.deepGrey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),

                  ///First Tourist
                  WhiteContainer(
                    child: ExpansionTileWidget(
                        text: 'Первый турист ', children: _defaultForm),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),

                  ///Second Tourist
                  WhiteContainer(
                    child: ExpansionTileWidget(
                        text: "Второй турист", children: _defaultForm),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),

                  ///Additional Tourists
                  ...[
                    for (int i = 0; i < addTourCount; i++) ...[
                      _additionalTourist(i + 1),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ]
                  ],

                  ///Add tourists
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(
                        vertical: 16.sp, horizontal: 10.sp),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.sp))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Добавить туриста',
                          style: CustomStyles.sfProMedium.copyWith(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              addTourCount++;
                              setState(() {});
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: CustomColors.blue,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.sp)),
                                side: BorderSide.none),
                            icon: SvgPicture.asset(
                              CustomIcons.plus,
                              height: 27.sp,
                            ))
                      ],
                    ),
                  ),

                  ///Information about billing
                  WhiteContainer(
                      child: Column(
                    children: [
                      Informator(
                          isFixed: false,
                          infoKey: "Тур",
                          infoValue: formattedPrice(order.tourPrice)),
                      Informator(
                          isFixed: false,
                          infoKey: "Топливный сбор",
                          infoValue: formattedPrice(order.fuelCharge)),
                      Informator(
                          isFixed: false,
                          infoKey: "Сервисный сбор",
                          infoValue: formattedPrice(order.serviceCharge)),
                      const Informator(
                        isFixed: false,
                        infoKey: "К оплате",
                        infoValue: "198 036 ₽",
                        valueColor: CustomColors.blue,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),

          ///Pay button
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 28.sp),
            color: Colors.white,
            child: BlueButton(
              onPressed: () {
                if (formkey.currentState == null) {
                  return;
                }
                final validation = formkey.currentState!.validate();
                context
                    .read<OrderBloc>()
                    .add(!validation ? OrderInvalidEvent() : OrderValidEvent());
                if (validation) {
                  Navigator.of(context).pushNamed("/order_completed");
                }
              },
              text: 'Оплатить ${formattedPrice(order.total)}',
            ),
          ),
        );
      },
    );
  }
}
