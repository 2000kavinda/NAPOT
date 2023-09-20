import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenAdmin/allOrdersSearchResults.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';

class AllOrders extends StatefulWidget {
  //const AllOrders({Key? key}) : super(key: key);
  /*final String textValue;
  AllOrders({required this.textValue});*/

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('orders');

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final idController = TextEditingController();
  final quantityController = TextEditingController();

  TextEditingController searchController = TextEditingController();

  /*Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference
        .where('id', isEqualTo: widget.textValue)
        .snapshots();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Orders'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
      ),
      body: Column(
        children: [
          //Start Search bar
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: TextField(
                              controller: searchController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                hintText: 'Search Student ID',
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.black12,
                                prefixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            onPressed: () {
                              // Show a search dialog
                              String textValue = searchController.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllOrdersSearchResults(
                                      textValue: textValue),
                                ),
                              );
                            },
                            child: Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //End Search bar
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

                /*List<DocumentSnapshot> filteredItems = items
                    .where((doc) =>
                    doc['itemName'].toString().toLowerCase().contains(searchKeyword))
                    .toList();*/

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
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 200,
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      doc['itemName'].toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Quantity : ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            doc['quantity'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Price : ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            doc['price'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Student ID : ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            doc['id'].toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.475,
                                          child: Column(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  collectionReference
                                                      .doc(docId)
                                                      .delete()
                                                      .then((_) {
                                                    //Navigator.of(context).pop(); // Close the dialog
                                                  }).catchError((error) {
                                                    print(
                                                        "Error deleting document: $error");
                                                  });
                                                },
                                                child: Text('Cancel',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                ),
                                                color: Colors.red,
                                                textColor: Colors.white,
                                                minWidth: 100,
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.475,
                                          child: Column(
                                            children: [
                                              MaterialButton(
                                                onPressed: () {
                                                  collectionReference
                                                      .doc(docId)
                                                      .delete()
                                                      .then((_) {
                                                    //Navigator.of(context).pop(); // Close the dialog
                                                  }).catchError((error) {
                                                    print(
                                                        "Error deleting document: $error");
                                                  });
                                                },
                                                child: Text('Complete',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                ),
                                                color: Colors.green,
                                                textColor: Colors.white,
                                                minWidth: 100,
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
