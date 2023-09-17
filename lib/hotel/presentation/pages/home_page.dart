import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/hotel/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotel_app/hotel/presentation/bloc/room_bloc/room_bloc.dart';

import '../../../core/constants/constants.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(builder: (ctx, state) {
      if (state is HotelLoading || state is HotelInitial) {
        return const LoadingPage();
      }
      final hotel = ctx.watch<HotelBloc>().state.hotel!;
      return Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          forceMaterialTransparency: true,
          centerTitle: true,
          title: Text('Отель',
              style: CustomStyles.sfProMedium.copyWith(fontSize: 18.sp)),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(20.sp))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Slider image
                      AnimationPageIndicator(imageUrls: hotel.imageUrls),
                      SizedBox(
                        height: 10.sp,
                      ),

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
                                  "${hotel.rating} ${hotel.ratingName}",
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
                          hotel.name,
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
                          hotel.adress,
                          style: CustomStyles.sfProMedium.copyWith(
                            color: CustomColors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),

                      ///Price
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'от ${hotel.minimalPrice} ₽',
                              style: CustomStyles.sfSemiBold.copyWith(
                                color: Colors.black,
                                fontSize: 30.sp,
                              ),
                            ),
                            Text(
                              hotel.priceForIt,
                              style: CustomStyles.sfRegular.copyWith(
                                color: CustomColors.deepGrey,
                                fontSize: 16.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  width: MediaQuery.of(ctx).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.sp),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Об отеле',
                          style: CustomStyles.sfProMedium.copyWith(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        ),
                        Wrap(
                          children: [
                            for (String feature
                                in hotel.aboutTheHotel.peculiarities)
                              FeaturesWidget(text: feature),
                          ],
                        ),
                        Text(
                          hotel.aboutTheHotel.description,
                          softWrap: true,
                          style: CustomStyles.sfRegular.copyWith(
                            color: CustomColors.descriptionTextColor,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(17)),
                          child: ListView(
                            shrinkWrap: true,
                            children: const [
                              FeatureTile(
                                  icon: CustomIcons.emojiHappy,
                                  text: "Удобства"),
                              FeatureTile(
                                  icon: CustomIcons.squareTick,
                                  text: "Что включено"),
                              FeatureTile(
                                  icon: CustomIcons.squareX,
                                  text: "Что не включено"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 28.sp),
          color: Colors.white,
          child: BlueButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/room");
              context.read<RoomBloc>().add(GetRoomEvent());
            },
            text: "К выбору номера",
          ),
        ),
      );
    });
  }
}

// class MyEffect extends JumpingDotEffect {
//   MyEffect({
//     Color activeDotColor = Colors.black,
//     super.jumpScale = 1.4,
//     super.verticalOffset = 0.0,
//     double offset = 16.0,
//     double dotWidth = 16.0,
//     double dotHeight = 16.0,
//     double spacing = 8.0,
//     double radius = 16,
//     Color dotColor = Colors.grey,
//     double strokeWidth = 1.0,
//     PaintingStyle paintStyle = PaintingStyle.fill,
//   }) : super(
//       dotWidth: dotWidth,
//       dotHeight: dotHeight,
//       spacing: spacing,
//       radius: radius,
//       strokeWidth: strokeWidth,
//       paintStyle: paintStyle,
//       dotColor: dotColor,
//       activeDotColor: activeDotColor);
//
//   @override
//   IndicatorPainter buildPainter(int count, double offset) {
//     return MyPainter(effect: this, count: count, offset: offset);
//   }
// }
//
// class MyPainter extends BasicIndicatorPainter {
//   final JumpingDotEffect effect;
//   MyPainter({required this.effect,
//     required int count,
//     required double offset,}): super(offset, count, effect);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     if (effect.verticalOffset != 0) {
//       canvas.translate(0, effect.verticalOffset / 2);
//     }
//     paintStillDots(canvas, size);
//     late final activeDotPainter;
//     switch(count) {
//       case 1:
//         activeDotPainter = Paint()..color = Colors.green;break;
//       case 2:
//         activeDotPainter = Paint()..color = Colors.red;break;
//       case 3:
//         activeDotPainter = Paint()..color = Colors.yellow;break;
//       case 4:
//         activeDotPainter = Paint()..color = Colors.brown;break;
//     }
//     final dotOffset = offset - offset.toInt();
//     if (offset > count - 1) {
//       final startDot = calcPortalTravel(size, effect.dotWidth / 2, dotOffset);
//       canvas.drawRRect(startDot, activeDotPainter);
//
//       final endDot = calcPortalTravel(
//         size,
//         ((count - 1) * distance) + (effect.dotWidth / 2),
//         1 - dotOffset,
//       );
//       canvas.drawRRect(endDot, activeDotPainter);
//       return;
//     }
//
//     var scale = 1.0;
//     var targetScale = effect.jumpScale - 1.0;
//
//     if (dotOffset < .5) {
//       scale = 1.0 + (dotOffset * 2) * targetScale;
//     } else {
//       scale = effect.jumpScale + ((1 - (dotOffset * 2)) * targetScale);
//     }
//     final piFactor = (dotOffset * math.pi);
//     var yPos = size.height / 2;
//     var xPos = offset.floor() * distance;
//     var x = (1 - ((math.cos(piFactor) + 1) / 2)) * distance;
//     var y = -math.sin(piFactor) * effect.verticalOffset;
//     xPos += x;
//     yPos += y;
//
//     final height = effect.dotHeight * scale;
//     final width = effect.dotWidth * scale;
//     final scaleRatio = width / effect.dotWidth;
//     final rRect = RRect.fromLTRBR(
//       xPos,
//       yPos - height / 2,
//       xPos + width,
//       yPos + height / 2,
//       dotRadius * scaleRatio,
//     );
//
//     canvas.drawRRect(rRect, activeDotPainter);
//   }
//
// }
