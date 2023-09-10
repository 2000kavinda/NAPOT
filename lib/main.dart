// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:untitled1/pages/addItemCanteen.dart';
// import 'package:untitled1/pages/myapp.dart';

// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: addItem(),
//   ));
// }
import 'package:flutter/material.dart';

void main() {
  runApp(myapp),
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: SearchStudent(),
    );
  }
}
