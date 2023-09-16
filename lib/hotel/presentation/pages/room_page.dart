import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/constants/constants.dart';
import 'package:hotel_app/hotel/presentation/bloc/hotel_bloc/hotel_bloc.dart';

import '../bloc/room_bloc/room_bloc.dart';
import '../widgets/widgets.dart';
import 'pages.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
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
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (context, state) {
        if (state is RoomLoading || state is RoomInitial) {
          return const LoadingPage();
        }
        final rooms = context
            .watch<RoomBloc>()
            .state
            .rooms;
        print(rooms.length);
        return Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(context
                .read<HotelBloc>()
                .state
                .hotel!
                .name,
                overflow: TextOverflow.ellipsis,
                style: CustomStyles.sfProMedium.copyWith(fontSize: 18.sp)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < rooms.length; i++) ...[
                  SizedBox(
                    height: 10.sp,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20.sp))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ///Slider image
                        SizedBox(
                          height: 250.sp,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: PageView(
                            controller: pageController,
                            children: [
                              for (int i2 = 0;
                              i2 < rooms[i].imageUrls.length;
                              i2++)
                                Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 20.sp),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: Image.network(
                                      rooms[i].imageUrls[i2],
                                      fit: BoxFit.fill,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                .expectedTotalBytes !=
                                                null
                                                ? loadingProgress
                                                .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),

                        ///Name
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Text(
                            rooms[i].name,
                            style: CustomStyles.sfRegular.copyWith(
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),

                        ///Features
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Wrap(
                            children: [
                              for (String feature in rooms[i].peculiarities)
                                FeaturesWidget(text: feature),
                            ],
                          ),
                        ),

                        ///Detail about room
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: SemiTransperantButton(
                              buttonColor: CustomColors.lightBlue,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.sp),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Подробнее о номере ",
                                      style: CustomStyles.sfProMedium.copyWith(
                                          color: CustomColors.blue,
                                          fontSize: 16.sp),
                                    ),
                                    const Icon(
                                      CupertinoIcons.right_chevron,
                                      color: CustomColors.blue,
                                    ),
                                  ],
                                ),
                              )),
                        ),

                        ///Price
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${rooms[i].price} ₽',
                                style: CustomStyles.sfSemiBold.copyWith(
                                  color: Colors.black,
                                  fontSize: 30.sp,
                                ),
                              ),
                              Text(
                                rooms[i].pricePer,
                                style: CustomStyles.sfRegular.copyWith(
                                  color: CustomColors.deepGrey,
                                  fontSize: 16.sp,
                                ),
                              )
                            ],
                          ),
                        ),

                        ///Choosing room
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 28.sp),
                          color: Colors.white,
                          child: BlueButton(
                            text: "К выбору номера",
                            onPressed: () {
                              Navigator.pushNamed(context, "/booking");
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
