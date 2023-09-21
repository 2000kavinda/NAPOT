import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/libraryAdmin/addRoomClass.dart';

class allBookings extends StatefulWidget {
  const allBookings({Key? key}) : super(key: key);

  @override
  State<allBookings> createState() => _allBookingsState();
}

class _allBookingsState extends State<allBookings> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('libraryRooms');
  final CollectionReference collectionRef = FirebaseFirestore.instance.collection('libraryBookings');


  final  roomNoController = TextEditingController();
  final  countController = TextEditingController();
  final  nameController = TextEditingController();
  final  idController = TextEditingController();
  final  sCountController = TextEditingController();
  final  purposeController = TextEditingController();
  final  fromController = TextEditingController();
  final  toController = TextEditingController();

  void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "roomNo": roomNoController.text,
      "count": countController.text,

    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }


  void post() async{
    String roomNo = roomNoController.text;
    String count= countController.text;

    String resp = await Store().save(
      roomNo: roomNo,
      count: count,

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Rooms',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16,),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: collectionRef.snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No items available.'),
                  );
                }

                // Access the data and display it
                final items = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: items.length * 2 - 1, // Double the item count to account for SizedBox widgets
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                      // Odd indices correspond to SizedBox widgets
                      return SizedBox(height: 16); // Adjust the height as needed
                    }

                    // Even indices correspond to data items
                    final dataIndex = index ~/ 2;
                    final doc = items[dataIndex].data() as Map<String, dynamic>;
                    final docId = items[dataIndex].id;

                    return Column(
                      children: [
                        //Start Room booking Details
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.95,
                          height: 210,
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width*0.95,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Room No ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        ),
                                        Text(doc['roomNo'].toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Row(
                                    children: [
                                      Text('Name : ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                      Text(doc['name'].toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text('Time Period',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 1),
                                  child: Row(
                                    children: [
                                      Text('From : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                      Text(doc['from'].toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text('To : ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                      Text(doc['to'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Row(
                                    children: [
                                      Text('Student ID : ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      Text(doc['id'].toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                  child: Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: (){
                                          roomNoController.text = doc['roomNo'];
                              countController.text = doc['count'];
                              nameController.text = doc['name'];
                              sCountController.text = doc['scount'];
                              idController.text = doc['id'];
                              purposeController.text = doc['purpose'];
                              fromController.text = doc['from'];
                              toController.text = doc['to'];

                              showDialog(
                                context: context,
                                builder: (context) => FullScreenDialog(
                                  content: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Room Number",
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
                                            controller: roomNoController,
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
                                            child: Text(
                                              "Capacity",
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
                                            controller: countController,
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
                                            child: Text(
                                              "Name",
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
                                            controller: nameController,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "Student ID",
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
                                            child: Text(
                                              "Number of students",
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
                                            controller: sCountController,
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
                                            child: Text(
                                              "Purpose",
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
                                            controller: purposeController,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text("Time duration"),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "From",
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
                                            controller: fromController,
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
                                            child: Text(
                                              "To",
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
                                            controller: toController,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),



                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              MaterialButton(
                                                onPressed: () {
                                                  // Update operation
                                                  post();
                                                  collectionRef.doc(docId).delete().then((_) {
                                                    Navigator.of(context).pop(); // Close the dialog
                                                  }).catchError((error) {
                                                    print("Error deleting document: $error");
                                                  });
                                                },
                                                child: Text('Ended'),
                                                color: Colors.blue,
                                                textColor: Colors.white,
                                                minWidth: 100,
                                                height: 40,
                                              ),
                                            ],
                                          ),




                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                                        }, 
                                        child: Text('Option',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //End Room booking details
                        
                      ],
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
