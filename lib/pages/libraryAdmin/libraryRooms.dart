import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class libraryRooms extends StatefulWidget {
  const libraryRooms({Key? key}) : super(key: key);

  @override
  State<libraryRooms> createState() => _libraryRoomsState();
}

class _libraryRoomsState extends State<libraryRooms> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('libraryRooms');

  final  roomNoController = TextEditingController();
  final  countController = TextEditingController();

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
        title: Text('Library Rooms'),
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
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
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


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              // Delete operation
                                              collectionReference.doc(docId).delete().then((_) {
                                                Navigator.of(context).pop(); // Close the dialog
                                              }).catchError((error) {
                                                print("Error deleting document: $error");
                                              });
                                            },
                                            child: Text('Delete'),
                                            color: Colors.red,
                                            textColor: Colors.white,
                                            minWidth: 100,
                                            height: 40,
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              // Update operation
                                              _updateData(docId);
                                            },
                                            child: Text('Update'),
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