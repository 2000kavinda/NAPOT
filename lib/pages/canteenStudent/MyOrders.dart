import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';

class MyOrders extends StatefulWidget {
  //const SearchResults({super.key, required String textValue});
  final String textValue;
  MyOrders({required this.textValue});


  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {

  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('orders');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference
        .where('id', isEqualTo: widget.textValue)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
        centerTitle: true,
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

                /*List<DocumentSnapshot> filteredItems = items
                    .where((doc) =>
                    doc['itemName'].toString().toLowerCase().contains(searchKeyword))
                    .toList();*/

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
                        
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width*0.95,
                                height: 120,
                                color: Colors.black12,
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width*0.95,
                                      height: 30,
                                      color: Colors.blueAccent,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(doc['itemName'].toString(),
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
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Row(
                                          children: [
                                            Text('Quantity : ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                            Text(doc['quantity'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Row(
                                          children: [
                                            Text('Total amount : LKR ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                            Text(doc['price'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Container(

                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Row(
                                          children: [
                                            Text('Order Status : ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                            Text('Pending',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            ],
                          ),
                        ),
                        
                      ],
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
