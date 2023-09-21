import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class libraryRooms extends StatefulWidget {
  const libraryRooms({Key? key}) : super(key: key);

  @override
  State<libraryRooms> createState() => _libraryRoomsState();
}

class _libraryRoomsState extends State<libraryRooms> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('libraryRooms');

  final roomNoController = TextEditingController();
  final countController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library Rooms Options',
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
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
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
                  itemCount: items.length * 2 -
                      1, // Double the item count to account for SizedBox widgets
                  itemBuilder: (BuildContext context, int index) {
                    if (index.isOdd) {
                      // Odd indices correspond to SizedBox widgets
                      return SizedBox(
                          height: 16); // Adjust the height as needed
                    }

                    // Even indices correspond to data items
                    final dataIndex = index ~/ 2;
                    final doc = items[dataIndex].data() as Map<String, dynamic>;
                    final docId = items[dataIndex].id;

                    return Column(
                      children: [
                        //Start Room Details
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 100,
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Room Number ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      doc['roomNo'],
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.475,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Student Capacity : ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              doc['count'],
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
                                      width: MediaQuery.sizeOf(context).width *
                                          0.475,
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              roomNoController.text =
                                                  doc['roomNo'];
                                              countController.text =
                                                  doc['count'];

                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    FullScreenDialog(
                                                  content: Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 50,
                                                          color: Colors.blueAccent,
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                width: MediaQuery
                                                                            .sizeOf(
                                                                                context)
                                                                        .width *
                                                                    0.2,
                                                                height: 50,
                                                                child: Row(
                                                                  children: [
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {
                                                                          
                                                                          },
                                                                      icon: Icon(Icons
                                                                          .arrow_back_ios),
                                                                      iconSize:
                                                                          25,
                                                                          color: Colors.white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(context).width*0.8,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text('Room Details Options',
                                                                        style: TextStyle(
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.white,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 30,
                                                        ),
                                                        Container(
                                                          child: Column(
                                                            children: [
                                                              //Start Room number
                                                              Row(
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                      bottom: 5,
                                                                    ),
                                                                    child: Text(
                                                                      'Room Number',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width,
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              roomNoController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.black12,
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
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      left: 10,
                                                                      bottom: 5,
                                                                    ),
                                                                    child: Text(
                                                                      'Capacity',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width,
                                                                child: Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20.0),
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              countController,
                                                                          keyboardType:
                                                                              TextInputType.text,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Colors.black12,
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
                                                                height: 20,
                                                              ),

                                                              //Start buttons
                                                              Container(
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              // Delete operation
                                                                              collectionReference.doc(docId).delete().then((_) {
                                                                                Navigator.of(context).pop(); // Close the dialog
                                                                              }).catchError((error) {
                                                                                print("Error deleting document: $error");
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text('Delete',
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold
                                                                                ),
                                                                                ),
                                                                            color:
                                                                                Colors.red,
                                                                            textColor:
                                                                                Colors.white,
                                                                            minWidth:
                                                                                100,
                                                                            height:
                                                                                40,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              // Update operation
                                                                              _updateData(docId);
                                                                            },
                                                                            child:
                                                                                Text('Update',
                                                                                style: TextStyle(
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.bold
                                                                                ),
                                                                                ),
                                                                            color:
                                                                                Colors.blue,
                                                                            textColor:
                                                                                Colors.white,
                                                                            minWidth:
                                                                                100,
                                                                            height:
                                                                                40,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              //End buttons
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Options',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            minWidth: 80,
                                            height: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //End Room Details
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
