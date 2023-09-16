import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/hotel/presentation/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:hotel_app/hotel/presentation/bloc/room_bloc/room_bloc.dart';
import 'package:hotel_app/hotel/presentation/widgets/expansion_tile.dart';

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HotelBloc()..add(GetHotelEvent()),
            ),
            BlocProvider(
              create: (context) => RoomBloc(),
            )
          ],
          child: Builder(builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: ThemeData.light(useMaterial3: true),
              darkTheme: ThemeData.dark(useMaterial3: true),
              // routes: Routes.routes,
              // initialRoute: "/booking",
              home: ExpansionTileWidget(),
            );
          }),
        );
      },
    );
  }
}
