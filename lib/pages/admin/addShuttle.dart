import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:untitled1/pages/canteenAdmin/canteenAddClass.dart';

class AddBus extends StatefulWidget {
  const AddBus({super.key});

  @override
  State<AddBus> createState() => _AddBusState();
}

class _AddBusState extends State<AddBus> {

  final  busNoController = TextEditingController();
  final  destinationController = TextEditingController();
  final  driverController = TextEditingController();
  final  stop1Controller = TextEditingController();
  final  stop2Controller = TextEditingController();
  final  stop3Controller = TextEditingController();
  final  stop4Controller = TextEditingController();
  final  stop5Controller = TextEditingController();
  final  stop6Controller = TextEditingController();
  final  stop7Controller = TextEditingController();
  final  time1Controller = TextEditingController();
  final  time2Controller = TextEditingController();
  final  time3Controller = TextEditingController();
  final  time4Controller = TextEditingController();
  final  time5Controller = TextEditingController();
  final  time6Controller= TextEditingController();
  final  time7Controller =TextEditingController();
  final  vehicleNoController =TextEditingController();

  late DatabaseReference dbRef;

  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('buses');
  }


  void post() async{
    String busNo = busNoController.text;
    String destination= destinationController.text;
    String driver= driverController.text;
    String stop1= stop1Controller.text;
    String stop2= stop2Controller.text;
    String stop3= stop3Controller.text;
    String stop4= stop4Controller.text;
    String stop5= stop5Controller.text;
    String stop6= stop6Controller.text;
    String stop7= stop7Controller.text;
    String time1= time1Controller.text;
    String time2= time2Controller.text;
    String time3= time3Controller.text;
    String time4= time4Controller.text;
    String time5= time5Controller.text;
    String time6= time6Controller.text;
    String time7= time7Controller.text;
    String   vehicleNo=vehicleNoController.text;
    //String resp = await StoreData().saveData(itemName: itemName,description: description,price: price,category:category,file: _image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Add new item"), Icon(Icons.logout)],
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
                    "Item name",
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
                  //controller: itemNameController,
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
                  //controller: descriptionController,
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
                    "Price",
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
                  //controller: priceController,
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
                    "Category",
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
                  //controller: categoryController,
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
                        //selectImage();
                      },
                      child: Text('Browse'),
                      color: Colors.green,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
                    //_image != null?
                        /*CircleAvatar(
                          radius: 45,
                          //backgroundImage: MemoryImage(_image!),
                        ):*/
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
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  // Align text to the left
                  child: Text(
                    "You can attach image by clicking on the browse button",
                    style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: (){},
                      child: Text('Cancel'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      minWidth: 100,
                      height: 40,
                    ),
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
