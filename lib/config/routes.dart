import 'package:flutter/cupertino.dart';
import 'package:hotel_app/hotel/presentation/pages/booking_page.dart';
import 'package:hotel_app/hotel/presentation/pages/pages.dart';

sealed class Routes {
  static WidgetBuilder get _homeRoute => (context) => const HomePage();

  static WidgetBuilder get _roomPageRoute => (context) => const RoomPage();

  static WidgetBuilder get _bookingPageRoute => (context) => BookingPage();

  static Map<String, WidgetBuilder> get routes =>
      {"/": _homeRoute, "/room": _roomPageRoute, "/booking": _bookingPageRoute};
}
