import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/pages/q&a/addQ&aClass.dart';
//import 'package:untitled1/pages/admin/shuttleAddClass.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class AddQA extends StatefulWidget {
  const AddQA({super.key});

  @override
  State<AddQA> createState() => _AddQAState();
}

class _AddQAState extends State<AddQA> {

  final  qController = TextEditingController();
  final  aController = TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('qa');
  }


  void post() async{
    String q = qController.text;
    String a= aController.text;

    String resp = await StoreQa().saveQa(
      q: q,
      a: a,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Add Q&A"), Icon(Icons.logout)],
          ),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Question",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: qController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),


                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    MaterialButton(
                      onPressed: (){
                        post();
                      },
                      child: Text('Post'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
