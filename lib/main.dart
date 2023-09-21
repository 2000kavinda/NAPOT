import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/startPages/splashPage.dart';
import 'package:untitled1/pages/studentProfile/marks.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,



    home: Splash(),



  ));
}
