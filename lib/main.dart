import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/pages/admin/pendingApproves.dart';
import 'package:untitled1/pages/admin/shuttles.dart';
import 'package:untitled1/pages/bottomBar/bottombar.dart';
import 'package:untitled1/pages/calendar.dart';
import 'package:untitled1/pages/canteenAdmin/addItemCanteen.dart';
import 'package:untitled1/pages/canteenAdmin/allOrders.dart';
import 'package:untitled1/pages/canteenAdmin/canteenItems.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/canteenStudent/allItems.dart';
//import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/event.dart';
import 'package:untitled1/pages/eventPage/event.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/library%204.dart';
import 'package:untitled1/pages/library2.dart';
import 'package:untitled1/pages/libraryAdmin/addRoom.dart';
import 'package:untitled1/pages/libraryAdmin/allBookings.dart';
import 'package:untitled1/pages/libraryAdmin/libraryRooms.dart';
import 'package:untitled1/pages/libraryStudent/availbleRooms.dart';
import 'package:untitled1/pages/library_3.dart';
import 'package:untitled1/pages/library_side.dart';
import 'package:untitled1/pages/library_success.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';

import 'package:untitled1/pages/messagerPage/message.dart';
import 'package:untitled1/pages/myapp.dart';
import 'package:untitled1/pages/q&a/addQ&a.dart';
import 'package:untitled1/pages/q&a/allAnswers.dart';
import 'package:untitled1/pages/q&a/allQA.dart';

import 'package:untitled1/pages/results.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/pages/shuttleService/shuttle.dart';
import 'package:untitled1/pages/st_menue.dart';
import 'package:untitled1/pages/startPages/signIn.dart';
import 'package:untitled1/pages/startPages/signup.dart';
import 'package:untitled1/pages/studentProfile/addBadge.dart';
import 'package:untitled1/pages/studentProfile/addCertificate.dart';
import 'package:untitled1/pages/studentProfile/allBadges.dart';
import 'package:untitled1/pages/studentProfile/personalData.dart';
import 'package:untitled1/pages/studentProfile/tempLogin.dart';
//import 'package:untitled1/pages/studentProfile/tempLogin.dart';
import 'package:untitled1/pages/test/main.dart';

import 'pages/admin/addShuttle.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,


    home: AddQA(),


  ));
}
