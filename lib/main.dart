import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/attendance.dart';
import 'package:home/calendar.dart';
import 'package:home/event.dart';
import 'package:home/results.dart';
import 'package:home/st_menu.dart';

import 'home_page.dart';

void main(){
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