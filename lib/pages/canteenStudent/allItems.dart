import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';

class allItems extends StatefulWidget {
  const allItems({Key? key}) : super(key: key);

  @override
  State<allItems> createState() => _CanteenItemsState();
}

class _CanteenItemsState extends State<allItems> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('canteenItems');
  final CollectionReference reference = FirebaseFirestore.instance.collection('cardDetails');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final idController = TextEditingController();
  final cardNoController = TextEditingController();
  final expController = TextEditingController();
  final cvvController = TextEditingController();
  final totalController = TextEditingController();

  int total = 0, qty = 0, price = 0;
  var nameToUpdate = "xyz";
  int balance=0;

  totalCal() {
    qty = int.parse(quantityController.text);
    price = int.parse(priceController.text);
    total = qty * price;
  }

  Future<int> getAvailableBalance(String cardNum,String exp,String cvv) async {
    try {
      final cardDataQuery = await FirebaseFirestore.instance
          .collection('cardDetails')
          .where('cardNum', isEqualTo: cardNum)
          .where('exp', isEqualTo: exp)
          .where('cvv', isEqualTo: cvv)
          .limit(1)
          .get();

      if (cardDataQuery.docs.isNotEmpty) {
        final cardData = cardDataQuery.docs.first.data() as Map<String, dynamic>;
        final balance = cardData['balance'] ?? 0;
        return balance;
      } else {
        // Card not found in the database
        return -1; // Or any other error code or value you prefer
      }
    } catch (e) {
      // Handle database errors
      print('Error fetching available balance: $e');
      return -1; // Or any other error code or value you prefer
    }
  }

  void post() async {
    String id = idController.text;
    String itemName = itemNameController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    String quantity = quantityController.text;

    String resp = await StoreData()
        .saveData(id: id, itemName: itemName, description: description, price: price, quantity: quantity);
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

  void updateBalance(String cardNum,int balance) {
    reference.doc(cardNum).update({
      "balance": balance,

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
                          builder: (context) => FullScreenDialog(
                        content: Container(
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
                                  readOnly: true,
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
                                  readOnly: true,
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
                                  readOnly: true,
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
                                        collectionReference
                                            .doc(docId)
                                            .delete()
                                            .then((_) {
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
                                      onPressed: () async {
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
                                                        hintText: 'MM/YY',
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
                                                            // Calculate and display the total
                                                            totalCal();
                                                          },
                                                          child: Text('Total = $total'),
                                                          color: Colors.green,
                                                          textColor: Colors.white,
                                                          minWidth: 100,
                                                          height: 40,
                                                        ),
                                                        MaterialButton(
                                                          onPressed: () async {
                                                            // Calculate the total
                                                            totalCal();

                                                            // Get the card number entered by the user
                                                            final cardNum = cardNoController.text;
                                                            final exp = expController.text;
                                                            final cvv = cvvController.text;

                                                            // Get available balance
                                                            var balance = await getAvailableBalance(cardNum,exp,cvv);

                                                            if (balance >= total) {
                                                              // Sufficient balance, proceed with the payment

                                                              post();
                                                              balance = balance - total;
                                                              updateBalance(cardNum,balance);
                                                              print('Payment successful');
                                                            } else {
                                                              // Insufficient balance
                                                              print('Insufficient balance');
                                                            }
                                                          },
                                                          child: Text('Pay'),
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
                      ));
                    },
                  ),
                  title: Text(doc['itemName']),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doc['description'].toString()),
                      Text(doc['price'].toString()),
                      Text(doc['category'].toString()),
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
      ),

    ],
    ),
    );
  }
}
