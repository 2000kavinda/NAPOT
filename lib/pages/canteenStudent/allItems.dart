import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';



class allItems extends StatefulWidget {
  const allItems({Key? key}) : super(key: key);

  @override
  State<allItems> createState() => _CanteenItemsState();
}

class _CanteenItemsState extends State<allItems> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('canteenItems');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final idController = TextEditingController();
  final cardNoController = TextEditingController();
  final expController = TextEditingController();
  final cvvController = TextEditingController();
  int total=0,qty=0,price=0;

  totalCal(){
    qty=int.parse(quantityController.text);
    price=int.parse(priceController.text);
    total=qty*price;
  }

  void _updateData(String docId) {
    collectionReference.doc(docId).update({
      "itemName": itemNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,

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
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            itemNameController.text = doc['itemName'];
                            descriptionController.text = doc['description'];
                            priceController.text = doc['price'];
                            //categoryController.text = doc['category'];

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
                                            "Quantity",
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
                                          controller: quantityController,
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
                                                totalCal();
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
                                                              height: 15,
                                                            ),
                                                            Image.asset('assets/card.png'),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "Card number",
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
                                                              controller: cardNoController,
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
                                                                "Expiry date",
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
                                                              controller: expController,
                                                              keyboardType: TextInputType.text,
                                                              decoration: const InputDecoration(
                                                                hintText:'MM/YY',
                                                                border: OutlineInputBorder(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "CVV",
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
                                                              controller: cvvController,
                                                              keyboardType: TextInputType.number,
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
                                                                    /*// Delete operation
                                                                    //collectionReference.doc(docId).delete().then((_) {
                                                                      //Navigator.of(context).pop(); // Close the dialog
                                                                    }).catchError((error) {
                                                                      print("Error deleting document: $error");
                                                                    });*/
                                                                  },
                                                                  child: Text('Total=Rs.$total'),
                                                                  color: Colors.red,
                                                                  textColor: Colors.white,
                                                                  minWidth: 100,
                                                                  height: 40,
                                                                ),
                                                                MaterialButton(
                                                                  onPressed: () {
                                                                    totalCal();
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
                            Text(doc['category']),
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
