import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/libraryStudent/bookRoomClass.dart';

class availableRoomsAdmin extends StatefulWidget {
  const availableRoomsAdmin({Key? key}) : super(key: key);

  @override
  State<availableRoomsAdmin> createState() => _availableRoomsState();
}

class _availableRoomsState extends State<availableRoomsAdmin> {
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
    String name= nameController.text;
    String id= idController.text;
    String sCount= sCountController.text;
    String purpose=purposeController.text;
    String from= fromController.text;
    String to= toController.text;

    String resp = await Stored().saved(
      roomNo: roomNo,
      count: count,
      name: name,
      id: id,
      scount: sCount,
      purpose: purpose,
      from: from,
      to: to,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Room Booking'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 16,),
          Text('Available rooms'),
          SizedBox(height: 16,),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: collectionReference.snapshots(),
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

                    return ListTile(
                      trailing:MaterialButton(
                        onPressed: () {

                            roomNoController.text = doc['roomNo'];
                            countController.text = doc['count'];

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
                                                // Delete operation
                                                /*collectionReference.doc(docId).delete().then((_) {
                                                  Navigator.of(context).pop(); // Close the dialog
                                                }).catchError((error) {
                                                  print("Error deleting document: $error");
                                                });*/
                                              },
                                              child: Text('Cancel'),
                                              color: Colors.blue,
                                              textColor: Colors.white,
                                              minWidth: 100,
                                              height: 40,
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                // Update operation
                                                post();
                                                collectionReference.doc(docId).delete().then((_) {
                            Navigator.of(context).pop(); // Close the dialog
                          }).catchError((error) {
                            print("Error deleting document: $error");
                          });
                                              },
                                              child: Text('Submit'),
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

                          // Delete operation
                          /*collectionReference.doc(docId).delete().then((_) {
                            Navigator.of(context).pop(); // Close the dialog
                          }).catchError((error) {
                            print("Error deleting document: $error");
                          });*/
                        },
                        child: Text('Book now'),
                        color: Colors.green,
                        textColor: Colors.white,
                        minWidth: 100,
                        height: 40,
                      ),

                      title: Text(doc['roomNo']),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['count']),

                        ],
                      ),

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
