import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class personalData extends StatefulWidget {
  //const personalData({Key? key}) : super(key: key);
  final String textValue;
  personalData({required this.textValue});


  @override
  State<personalData> createState() => _personalDataState();
}

class _personalDataState extends State<personalData> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');

  final batchController = TextEditingController();
  final degreeController = TextEditingController();
  final emailController = TextEditingController();
  final indexController = TextEditingController();
  final nameController = TextEditingController();
  final nicController = TextEditingController();

  void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "batch": batchController.text,
      "degree": degreeController.text,
      "email": emailController.text,
      "index": indexController.text,
      "name": nameController.text,
      "nic": nicController.text,
    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }


  Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference
        .where('index', isEqualTo: widget.textValue)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Data'),
      ),
      body: Column(
        children: [
          SizedBox(height: 16,),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getFilteredItemsStream(),
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
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          batchController.text = doc['batch'];
                          degreeController.text = doc['degree'];
                          emailController.text = doc['email'];
                          indexController.text = doc['index'];
                          nameController.text = doc['name'];
                          nicController.text = doc['nic'];


                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
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
                                          "Full name",
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
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "NIC number",
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
                                        controller: nicController,
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
                                        controller: indexController,
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
                                        child: Text(
                                          "Batch",
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
                                        controller: batchController,
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
                                          "Degree",
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
                                        controller: degreeController,
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
                                          "Email",
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
                                        controller: emailController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          /*MaterialButton(
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
                                          ),*/
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
                      title: Text(doc['name']),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['index']),
                          Text(doc['nic']),
                          Text(doc['batch']),
                          Text(doc['degree']),
                          Text(doc['email']),

                        ],
                      ),
                      leading:CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(doc['imageLink']),
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
