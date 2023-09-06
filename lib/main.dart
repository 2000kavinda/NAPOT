import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:napot/pages/library2.dart';
import 'package:napot/pages/library_3.dart';
import 'package:napot/pages/library_side.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: roombooking(),
    );
  }
}
