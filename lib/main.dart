import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/pages/attendance.dart';
import 'package:home/pages/calendar.dart';
import 'package:home/pages/event.dart';
import 'package:home/pages/results.dart';
import 'package:home/pages/st_menu.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
