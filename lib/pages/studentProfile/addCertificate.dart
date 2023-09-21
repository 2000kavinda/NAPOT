import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/pages/studentProfile/addBadgeClass.dart';
import 'package:untitled1/pages/studentProfile/addCertificateClass.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class addcertificate extends StatefulWidget {
  const addcertificate({super.key});

  @override
  State<addcertificate> createState() => _addcertificateState();
}

class _addcertificateState extends State<addcertificate> {
  final idController = TextEditingController();
  final certificateNameController = TextEditingController();
  final descriptionController = TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('certificates');
  }

  Uint8List? _image;

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("Please select an image");
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void post() async {
    String id = idController.text;
    String description = descriptionController.text;
    String certificatename = certificateNameController.text;

    String resp = await Store().saveing(
        id: id,
        description: description,
        certificatename: certificatename,
        file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add new Certificate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
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

                //Start Student ID
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Student ID',
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
                            controller: idController,
                            keyboardType: TextInputType.number,
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
                //End Student ID

                //Start Cerification name
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Certification name',
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
                            controller: certificateNameController,
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
                //End Certification name

                //Start Description
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Text(
                        'Description',
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
                            controller: descriptionController,
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
                  height: 30,
                ),
                //End Description


                //Start image
                Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 150,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            'Add image',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 10),
                                          child: MaterialButton(
                                            onPressed: () {
                                              selectImage();
                                            },
                                            child: Text(
                                              'Browse',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            minWidth: 100,
                                            height: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                        height: 140,
                                        child: _image != null
                                            ? CircleAvatar(
                                                radius: 45,
                                                backgroundImage:
                                                    MemoryImage(_image!),
                                              )
                                            : const CircleAvatar(
                                                radius: 45,
                                                backgroundImage: NetworkImage(
                                                    'https://upload.wikimedia.org/wikipedia/commons/a/a3/The_View_Logo_%282014%29.png'),
                                              )),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                //End image
                
                SizedBox(
                  height: 45,
                ),

                //Start Post button
                Container(
                  child: Column(
                    children: [
                       Container(
                            width: 120,
                            height: 50,
                            child: MaterialButton(
                              onPressed: () {
                                post();
                              },
                              child: Text(
                                'Post now',
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
                          ),
                    ],
                  ),
                ),
                //End Post button

                SizedBox(
                  height: 60,
                ),
                
              ],
            ),
          
        ));
  }
}
