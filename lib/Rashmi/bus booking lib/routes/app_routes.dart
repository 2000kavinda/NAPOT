import 'package:flutter/material.dart';
import 'package:rashmi_s_application2/presentation/shuttle_booking_page_screen/shuttle_booking_page_screen.dart';

class AppRoutes {
  static const String shuttleBookingPageScreen = '/shuttle_booking_page_screen';

  static Map<String, WidgetBuilder> routes = {
    shuttleBookingPageScreen: (context) => ShuttleBookingPageScreen()
  };
}
