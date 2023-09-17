import 'package:flutter/cupertino.dart';
import 'package:hotel_app/hotel/presentation/pages/order_completed_page.dart';
import 'package:hotel_app/hotel/presentation/pages/pages.dart';

sealed class Routes {
  static WidgetBuilder get _homeRoute => (context) => const HomePage();

  static WidgetBuilder get _roomPageRoute => (context) => const RoomPage();

  static WidgetBuilder get _bookingPageRoute => (context) => const OrderPage();
  static WidgetBuilder get _orderCompleted =>
      (context) => const OrderCompleted();

  static Map<String, WidgetBuilder> get routes => {
        "/": _homeRoute,
        "/room": _roomPageRoute,
        "/booking": _bookingPageRoute,
        "/order_completed": _orderCompleted,
      };
}
