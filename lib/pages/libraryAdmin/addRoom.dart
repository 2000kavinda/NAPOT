import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/pages/admin/shuttleAddClass.dart';
import 'package:untitled1/pages/libraryAdmin/addRoomClass.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({super.key});

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  final roomNoController = TextEditingController();
  final countController = TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('buses');
  }

  void post() async {
    String roomNo = roomNoController.text;
    String count = countController.text;

    String resp = await Store().save(
      roomNo: roomNo,
      count: count,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add New Room',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
                //Start Room number
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Room number',
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
                            controller: roomNoController,
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
                //End Room number

                //Start Capacity
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Capacity',
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
                            controller: countController,
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
                //End Capacity
                SizedBox(
                  height: 30,
                ),
                //Start buttons
                Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                              color: Colors.blue,
                              textColor: Colors.white,
                              minWidth: 100,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Column(
                          children: [
                            MaterialButton(
                              onPressed: () {
                                post();
                              },
                              child: Text('Save',
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
                        ),
                      ),
                    ],
                  ),
                ),
                //End buttons

                SizedBox(
                  height: 15,
                ),

                
              ],
            ),
          
        ));
  }
}
