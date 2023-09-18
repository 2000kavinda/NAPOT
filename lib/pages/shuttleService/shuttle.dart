import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/auth_methods.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class shuttle extends StatefulWidget {
  const shuttle({Key? key}) : super(key: key);

  @override
  State<shuttle> createState() => _shuttleState();
}

class _shuttleState extends State<shuttle> {
  final CollectionReference collectionReference = FirebaseFirestore.instance
      .collection('buses');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final degreeController = TextEditingController();
  final passwordController = TextEditingController();
  final indexController = TextEditingController();
  final batchController = TextEditingController();
  final nicController = TextEditingController();

  void registerUser() async {
    String resp = await AuthMethods().registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      degree: degreeController.text,
      index: indexController.text,
      batch: batchController.text,
      nic: nicController.text,

    );
  }

    /*void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "itemName": itemNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,
      "category": categoryController.text,
    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }*/


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Shuttle schedule'),
        ),
        body: Column(
          children: [
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
                    itemCount: items.length * 2 - 1,
                    // Double the item count to account for SizedBox widgets
                    itemBuilder: (BuildContext context, int index) {
                      if (index.isOdd) {
                        // Odd indices correspond to SizedBox widgets
                        return SizedBox(
                            height: 16); // Adjust the height as needed
                      }

                      // Even indices correspond to data items
                      final dataIndex = index ~/ 2;
                      final doc = items[dataIndex].data() as Map<String,
                          dynamic>;
                      final docId = items[dataIndex].id;

                      return ListTile(
                        trailing: MaterialButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  FullScreenDialog(
                                    content: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(doc['destination']),
                                            Text(doc['time1']),
                                            Text(doc['busNo']),
                                            Text(doc['vehicleNo']),
                                            Text(doc['driver']),
                                            SizedBox(
                                              height: 60,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop1'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time1'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop2'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time2'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop3'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time3'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop4'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time4'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop5'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time5'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop6'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time6'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  doc['stop7'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),Text(
                                                  doc['time7'],
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
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
                          child: Text('Timetable'),
                          color: Colors.green,
                          textColor: Colors.white,
                          minWidth: 100,
                          height: 40,
                        ),
                        title: Text(doc['destination']),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doc['time1']),
                            Text(doc['busNo']),
                            Text(doc['vehicleNo']),
                            Text(doc['driver']),
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

