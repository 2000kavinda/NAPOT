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

  final  idController =TextEditingController();
  final  certificateNameController = TextEditingController();
  final  descriptionController= TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('certificates');
  }

  Uint8List? _image;

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if(_file != null){
      return await _file.readAsBytes();
    }
    print("Please select an image");
  }

  void selectImage() async{
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void post() async{
    String id = idController.text;
    String description= descriptionController.text;
    String certificatename= certificateNameController.text;

    String resp = await Store().saveing(id: id,description: description, certificatename: certificatename, file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Add new certificate"), Icon(Icons.logout)],
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
                  // Align text to the left
                  child: Text(
                    "Studen ID",
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
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // Align text to the left
                  child: Text(
                    "certificate name",
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
                  controller: certificateNameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // Align text to the left
                  child: Text(
                    "Description",
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
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  // Align text to the left
                  child: Text(
                    "Add images",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        selectImage();
                      },
                      child: Text('Browse'),
                      color: Colors.green,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                    _image != null?
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: MemoryImage(_image!),
                    ):
                    const CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/a3/The_View_Logo_%282014%29.png'),
                    )
                  ],
                ),
                /*Align(
                  alignment: Alignment.centerLeft,
                  child:
                ),*/

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
