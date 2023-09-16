import 'package:flutter/material.dart';
import 'package:rashmi_s_application3/presentation/bus_number_01_screen/bus_number_01_screen.dart';

class AppRoutes {
  static const String busNumber01Screen = '/bus_number_01_screen';

  static Map<String, WidgetBuilder> routes = {
    busNumber01Screen: (context) => BusNumber01Screen()
  };
}
