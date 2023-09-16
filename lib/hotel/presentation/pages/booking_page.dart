import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/hotel/presentation/widgets/widgets.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/textinputformatters.dart';

final data = {
  "id": 1,
  "hotel_name": "Лучший пятизвездочный отель в Хургаде, Египет",
  "hotel_adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
  "horating": 5,
  "rating_name": "Превосходно",
  "departure": "Москва",
  "arrival_country": "Египет, Хургада",
  "tour_date_start": "19.09.2023",
  "tour_date_stop": "27.09.2023",
  "number_of_nights": 7,
  "room": "Люкс номер с видом на море",
  "nutrition": "Все включено",
  "tour_price": 289400,
  "fuel_charge": 9300,
  "service_charge": 2150
};

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final controller = ExpansionTileController();

  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  late final Animation<double> _iconTurns;
  bool _isExpanded = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
  }

  Widget _buildIcon(BuildContext context,
      {ExpansionTileController? controller}) {
    return GestureDetector(
      onTap: () {
        _toggleExpansion(controller);
      },
      child: SemiTransperantButton(
        buttonColor: CustomColors.lightBlue,
        child: RotationTransition(
          turns: _iconTurns,
          child: Icon(
            Icons.expand_more,
            size: 24.sp,
            color: CustomColors.blue,
          ),
        ),
      ),
    );
  }

  void _toggleExpansion(ExpansionTileController? controller) {
    if (controller != null) {
      controller.isExpanded ? controller.collapse() : controller.expand();
    }
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.maybeOf(context)?.writeState(context, _isExpanded);
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.sp))),
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
                              "${data["horating"]} ${data["rating_name"]}",
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
                      data["hotel_name"] as String,
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
                      data["hotel_adress"] as String,
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
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 6.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.sp))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Informator(
                      infoKey: 'Вылет из',
                      infoValue: data["departure"] as String),
                  Informator(
                      infoKey: 'Страна, город',
                      infoValue: data["arrival_country"] as String),
                  Informator(
                      infoKey: 'Даты',
                      infoValue:
                          "${data["tour_date_start"]}-${data["tour_date_stop"]}"),
                  Informator(
                      infoKey: 'Кол-во ночей',
                      infoValue: "${data["number_of_nights"]} ночей"),
                  Informator(
                      infoKey: 'Отель',
                      infoValue: data["hotel_name"] as String),
                  Informator(
                      infoKey: 'Номер', infoValue: data["room"] as String),
                  Informator(
                      infoKey: 'Питание',
                      infoValue: data["nutrition"] as String),
                ],
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.sp))),
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
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            formatter: TextInputFormatters.phoneNumberFormatter,
                            labelText: 'Номер телефона',
                            prefixText: "+7 ",
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          CustomTextField(
                            validator: (value) {
                              if (!value!.contains("@")) {
                                return "Email is invalid";
                              }
                              return null;
                            },
                            formatter: TextInputFormatters.emailFormatterRegEx,
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
                      ))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.sp))),
              child: ExpansionTile(
                controller: controller,
                trailing: _buildIcon(context, controller: controller),
                collapsedShape: InputBorder.none,
                shape: InputBorder.none,
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                title: Text(
                  'Первый турист ',
                  style: CustomStyles.sfProMedium.copyWith(
                    color: Colors.black,
                    fontSize: 22.sp,
                  ),
                ),
                children: [
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
                  const CustomTextField(
                      labelText: 'Срок действия загранпаспорта'),
                  SizedBox(
                    height: 10.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 16.sp),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.sp))),
              child: ExpansionTile(
                trailing: _buildIcon(context),
                collapsedShape: InputBorder.none,
                shape: InputBorder.none,
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                title: Text(
                  'Первый турист ',
                  style: CustomStyles.sfProMedium.copyWith(
                    color: Colors.black,
                    fontSize: 22.sp,
                  ),
                ),
                children: const [],
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
