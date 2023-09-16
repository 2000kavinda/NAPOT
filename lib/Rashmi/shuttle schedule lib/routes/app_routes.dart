import 'package:flutter/material.dart';
import 'package:rashmi_s_application1/presentation/shuttle_schedule_screen/shuttle_schedule_screen.dart';

class AppRoutes {
  static const String shuttleScheduleScreen = '/shuttle_schedule_screen';

  static Map<String, WidgetBuilder> routes = {
    shuttleScheduleScreen: (context) => ShuttleScheduleScreen()
  };
}
