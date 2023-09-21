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
          title: Text('Post a Question',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
          centerTitle: true,
          leading: IconButton(
          onPressed: () {
            Navigator.of(context) .pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
        ),

        body: SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Add a Question',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                controller: qController,
                  keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    MaterialButton(
                      onPressed: (){
                        post();
                      },
                      child: Text('Post',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                  ],
                )
              ],
            ),
          
        )
    );
  }
}
