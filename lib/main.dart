import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/pages/admin/pendingApproves.dart';
import 'package:untitled1/pages/calendar.dart';
import 'package:untitled1/pages/canteenAdmin/addItemCanteen.dart';
import 'package:untitled1/pages/canteenAdmin/canteenItems.dart';
import 'package:untitled1/pages/canteenStudent/allItems.dart';
import 'package:untitled1/pages/event.dart';
import 'package:untitled1/pages/eventPage/event.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';
import 'package:untitled1/pages/myapp.dart';
import 'package:untitled1/pages/results.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/pages/startPages/signIn.dart';
import 'package:untitled1/pages/startPages/signup.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}
