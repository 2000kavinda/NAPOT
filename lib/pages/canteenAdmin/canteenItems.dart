import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanteenItems extends StatefulWidget {
  const CanteenItems({Key? key}) : super(key: key);

  @override
  State<CanteenItems> createState() => _CanteenItemsState();
}

class _CanteenItemsState extends State<CanteenItems> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('canteenItems');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final categoryController = TextEditingController();

  void _updateData(String docId) {
    var it=itemNameController.text;
    collectionReference.doc(docId).update({
      "itemName": it,
      "description": descriptionController.text,
      "price": priceController.text,
      "category": categoryController.text,
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
        title: Text('Canteen Items'),
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
                            itemNameController.text = doc['itemName'];
                            descriptionController.text = doc['description'];
                            priceController.text = doc['price'];
                            categoryController.text = doc['category'];

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
                                          controller: itemNameController,
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
                                          controller: priceController,
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
                                          controller: categoryController,
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
                        title: Text(doc['itemName']),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doc['description']),
                            Text(doc['price']),
                          ],
                        ),
                        leading: Image.network(
                          doc['imageLink'],
                          height: 100,
                          fit: BoxFit.cover,
                          width: 100,
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
