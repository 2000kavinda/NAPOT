import 'package:flutter/material.dart';
import 'package:untitled1/pages/library2.dart';
import 'package:untitled1/pages/libraryAdmin/addRoom.dart';

void main() {
  runApp(MaterialApp(
    title: 'Complains',
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  leading: const BackButton(
    color: Colors.black, // <-- SEE HERE
  ),
  centerTitle: true,
        title: Text(
          'Complains',
 
        ),
      ),
      body: AddRoom(),
    );
  }
}