import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';
import 'package:untitled1/pages/canteenStudent/searchResults.dart';

class allItems extends StatefulWidget {
  //const allItems({Key? key}) : super(key: key);

  @override
  State<allItems> createState() => _CanteenItemsState();
}

class _CanteenItemsState extends State<allItems> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('canteenItems');
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('cardDetails');
  //String searchKeyword = '';

  final itemNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  final idController = TextEditingController();
  final cardNoController = TextEditingController();
  final expController = TextEditingController();
  final cvvController = TextEditingController();
  final totalController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  Stream<QuerySnapshot> _getFilteredItemsStream() {
    return collectionReference.where('itemName', isEqualTo: '111').snapshots();
  }

  Stream<QuerySnapshot> _getFilteredSpecials() {
    return collectionReference
        .where('category', isEqualTo: 'special')
        .snapshots();
  }

  int total = 0, qty = 0, price = 0;
  var nameToUpdate = "xyz";
  int balance = 0;

  totalCal() {
    qty = int.parse(quantityController.text);
    price = int.parse(priceController.text);
    total = qty * price;
  }

  /*void onSearch(String keyword) {
    setState(() {
      searchKeyword = keyword.toLowerCase();
    });
  }*/

  Future<int> getAvailableBalance(
      String cardNum, String exp, String cvv) async {
    try {
      final cardDataQuery = await FirebaseFirestore.instance
          .collection('cardDetails')
          .where('cardNum', isEqualTo: cardNum)
          .where('exp', isEqualTo: exp)
          .where('cvv', isEqualTo: cvv)
          .limit(1)
          .get();

      if (cardDataQuery.docs.isNotEmpty) {
        final cardData =
            cardDataQuery.docs.first.data() as Map<String, dynamic>;
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

    String resp = await StoreData().saveData(
        id: id,
        itemName: itemName,
        description: description,
        price: price,
        quantity: quantity);
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

  void updateBalance(String cardNum, int balance) {
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
        title: Text('Canteen Food Items'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
      ),
      body: Column(
        children: [
          //Start Search Bar
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
                                hintText: 'Search here',
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
                                  builder: (context) =>
                                      SearchResults(textValue: textValue),
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
          //End Search Bar
          //Start Todays Special Bar
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 40,
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Todays Special',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //End Todays special Bar

          SizedBox(
            height: 5,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getFilteredSpecials(),
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
                        //Start Item Section
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                color: Colors.black12,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.25,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundImage:
                                                NetworkImage(doc['imageLink']),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.70,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      doc['itemName']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'LKR.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      doc['price'].toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //Start Buy Button
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                MaterialButton(
                                                              onPressed: () {
                                                                itemNameController
                                                                        .text =
                                                                    doc['itemName'];
                                                                descriptionController
                                                                        .text =
                                                                    doc['description'];
                                                                priceController
                                                                        .text =
                                                                    doc['price'];
                                                                //categoryController.text = doc['category'];

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            FullScreenDialog(
                                                                              content: SingleChildScrollView(
                                                                                child: Container(
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              height: 300,
                                                                                              child: Image.network(
                                                                                                doc['imagebanner'],
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                                width: 100,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, top: 10),
                                                                                        child: Container(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Description',
                                                                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: Alignment.center,
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                                  child: Text(
                                                                                                    doc['description'],
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      //fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                      ),
                                                                                      //Start Fill details bar
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width,
                                                                                        height: 40,
                                                                                        color: Colors.blueAccent,
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(left: 10),
                                                                                                  child: Text(
                                                                                                    'Fill the following details',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Fill details bar
                                                                                      SizedBox(
                                                                                        height: 20,
                                                                                      ),
                                                                                      //Start Student ID
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Student ID',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        controller: idController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Student ID
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Item name
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Item name',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: itemNameController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Item name
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Description
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Description',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: descriptionController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Description
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Price
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Price',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: priceController,
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Price
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Quantity
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Quantity',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        controller: quantityController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Quantity

                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                      ),

                                                                                      //Start buttons

                                                                                      Container(
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //Start Cancel button
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    child: ElevatedButton(
                                                                                                      onPressed: () {
                                                                                                        Navigator.of(context).pop();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                        child: Text(
                                                                                                          'Cancel',
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            color: Colors.white,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            //End Cancel button
                                                                                            //Start Order button
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    child: ElevatedButton(
                                                                                                      onPressed: () async {
                                                                                                        totalCal();
                                                                                                        showDialog(
                                                                                                          context: context,
                                                                                                          builder: (context) => FullScreenDialog(
                                                                                                            content: SingleChildScrollView(
                                                                                                              child: Column(
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    child: Column(
                                                                                                                      children: [
                                                                                                                        //Start Image banner
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Image.asset(
                                                                                                                            'assets/images/payImg2.png',
                                                                                                                            fit: BoxFit.fitWidth,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Image banner

                                                                                                                        SizedBox(
                                                                                                                          height: 10,
                                                                                                                        ),
                                                                                                                        //Start card number
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'Card Number',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: cardNoController,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End card number
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        //Start Expire date
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'Expiry Date',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: expController,
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      hintText: 'MM/YY',
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Expire date
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        //Start CVV
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'CVV',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: cvvController,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End CVV
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),

                                                                                                                        //Start Total Value
                                                                                                                        Container(
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                                                                child: Row(
                                                                                                                                  children: [
                                                                                                                                    Text(
                                                                                                                                      'Total Payment : LKR ',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 18,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Text(
                                                                                                                                      '$total',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 18,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Total Value
                                                                                                                        SizedBox(
                                                                                                                          height: 30,
                                                                                                                        ),

                                                                                                                        //Start buttons

                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            //Start Cancel button
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                                              child: Column(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                                    child: ElevatedButton(
                                                                                                                                      onPressed: () {
                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                      },
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                                                        child: Text(
                                                                                                                                          'Cancel',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 18,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            color: Colors.white,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            //End Cancel button
                                                                                                                            //Start Pay now button
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                                              child: Column(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                                    child: ElevatedButton(
                                                                                                                                      onPressed: () async {
                                                                                                                                        // Calculate the total
                                                                                                                                        totalCal();

                                                                                                                                        // Get the card number entered by the user
                                                                                                                                        final cardNum = cardNoController.text;
                                                                                                                                        final exp = expController.text;
                                                                                                                                        final cvv = cvvController.text;

                                                                                                                                        // Get available balance
                                                                                                                                        var balance = await getAvailableBalance(cardNum, exp, cvv);

                                                                                                                                        if (balance >= total) {
                                                                                                                                          // Sufficient balance, proceed with the payment

                                                                                                                                          post();
                                                                                                                                          balance = balance - total;
                                                                                                                                          updateBalance(cardNum, balance);
                                                                                                                                          print('Payment successful');
                                                                                                                                        } else {
                                                                                                                                          // Insufficient balance
                                                                                                                                          print('Insufficient balance');
                                                                                                                                        }
                                                                                                                                      },
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                                                        child: Text(
                                                                                                                                          'Pay now',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 18,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            color: Colors.white,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            //End Pay now button
                                                                                                                          ],
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
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                        child: Text(
                                                                                                          'Order',
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            color: Colors.white,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),

                                                                                            //End Order button
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End buttons
                                                                                      SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ));
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  'Buy now',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              color: Colors
                                                                  .blueAccent,
                                                              textColor:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //End Buy button
                                              ],
                                            ),
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
                        //End Item Section
                      ],
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          
          //Start All Items bar
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 40,
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'All Food items',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //End All items bar
          SizedBox(
                          height: 10,
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
                        
                        //Start Items Selection
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                color: Colors.black12,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.25,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundImage:
                                                NetworkImage(doc['imageLink'],
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.70,
                                      height: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      doc['itemName']
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text(
                                                      'LKR.',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      doc['price'].toString(),
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //Start Buy Button
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                MaterialButton(
                                                              onPressed: () {
                                                                itemNameController
                                                                        .text =
                                                                    doc['itemName'];
                                                                descriptionController
                                                                        .text =
                                                                    doc['description'];
                                                                priceController
                                                                        .text =
                                                                    doc['price'];
                                                                //categoryController.text = doc['category'];

                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            FullScreenDialog(
                                                                              content: SingleChildScrollView(
                                                                                child: Container(
                                                                                  child: Column(
                                                                                    children: [
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              height: 300,
                                                                                              child: Image.network(
                                                                                                doc['imagebanner'],
                                                                                                height: 100,
                                                                                                fit: BoxFit.cover,
                                                                                                width: 100,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),

                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 10, top: 10),
                                                                                        child: Container(
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Row(
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Description',
                                                                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: Alignment.center,
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                                  child: Text(
                                                                                                    doc['description'],
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 14,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      //fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),

                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                      ),
                                                                                      //Start Fill details bar
                                                                                      Container(
                                                                                        width: MediaQuery.sizeOf(context).width,
                                                                                        height: 40,
                                                                                        color: Colors.blueAccent,
                                                                                        child: Column(
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(left: 10),
                                                                                                  child: Text(
                                                                                                    'Fill the following details',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      color: Colors.white,
                                                                                                    ),
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Fill details bar
                                                                                      SizedBox(
                                                                                        height: 20,
                                                                                      ),
                                                                                      //Start Student ID
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Student ID',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        controller: idController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Student ID
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Item name
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Item name',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: itemNameController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Item name
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Description
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Description',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: descriptionController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Description
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Price
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Price',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        readOnly: true,
                                                                                                        controller: priceController,
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Price
                                                                                      SizedBox(
                                                                                        height: 15,
                                                                                      ),

                                                                                      //Start Quantity
                                                                                      Container(
                                                                                        child: Column(
                                                                                          children: [
                                                                                            Row(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsets.only(
                                                                                                    left: 15,
                                                                                                    bottom: 5,
                                                                                                  ),
                                                                                                  child: Text(
                                                                                                    'Quantity',
                                                                                                    style: TextStyle(
                                                                                                      fontSize: 16,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                                      child: TextField(
                                                                                                        controller: quantityController,
                                                                                                        keyboardType: TextInputType.text,
                                                                                                        decoration: const InputDecoration(
                                                                                                          border: InputBorder.none,
                                                                                                          filled: true,
                                                                                                          fillColor: Colors.black12,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End Quantity

                                                                                      SizedBox(
                                                                                        height: 30,
                                                                                      ),

                                                                                      //Start buttons

                                                                                      Container(
                                                                                        child: Row(
                                                                                          children: [
                                                                                            //Start Cancel button
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    child: ElevatedButton(
                                                                                                      onPressed: () {
                                                                                                        Navigator.of(context).pop();
                                                                                                      },
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                        child: Text(
                                                                                                          'Cancel',
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            color: Colors.white,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            //End Cancel button
                                                                                            //Start Order button
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                              child: Column(
                                                                                                children: [
                                                                                                  ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    child: ElevatedButton(
                                                                                                      onPressed: () async {
                                                                                                        totalCal();
                                                                                                        showDialog(
                                                                                                          context: context,
                                                                                                          builder: (context) => FullScreenDialog(
                                                                                                            content: SingleChildScrollView(
                                                                                                              child: Column(
                                                                                                                children: [
                                                                                                                  Container(
                                                                                                                    child: Column(
                                                                                                                      children: [
                                                                                                                        //Start Image banner
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Image.asset(
                                                                                                                            'assets/images/payImg2.png',
                                                                                                                            fit: BoxFit.fitWidth,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Image banner

                                                                                                                        SizedBox(
                                                                                                                          height: 10,
                                                                                                                        ),
                                                                                                                        //Start card number
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'Card Number',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: cardNoController,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End card number
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        //Start Expire date
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'Expiry Date',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: expController,
                                                                                                                                    keyboardType: TextInputType.text,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      hintText: 'MM/YY',
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Expire date
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        //Start CVV
                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: const EdgeInsets.only(
                                                                                                                                left: 15,
                                                                                                                                bottom: 5,
                                                                                                                              ),
                                                                                                                              child: Text(
                                                                                                                                'CVV',
                                                                                                                                style: TextStyle(
                                                                                                                                  fontSize: 18,
                                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Container(
                                                                                                                          width: MediaQuery.sizeOf(context).width,
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 15, right: 15),
                                                                                                                                child: ClipRRect(
                                                                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                                                                  child: TextField(
                                                                                                                                    controller: cvvController,
                                                                                                                                    keyboardType: TextInputType.number,
                                                                                                                                    decoration: const InputDecoration(
                                                                                                                                      border: InputBorder.none,
                                                                                                                                      filled: true,
                                                                                                                                      fillColor: Colors.black12,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End CVV
                                                                                                                        SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),

                                                                                                                        //Start Total Value
                                                                                                                        Container(
                                                                                                                          child: Column(
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: const EdgeInsets.only(left: 10),
                                                                                                                                child: Row(
                                                                                                                                  children: [
                                                                                                                                    Text(
                                                                                                                                      'Total Payment : LKR ',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 18,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Text(
                                                                                                                                      '$total',
                                                                                                                                      style: TextStyle(
                                                                                                                                        fontSize: 18,
                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        //End Total Value
                                                                                                                        SizedBox(
                                                                                                                          height: 30,
                                                                                                                        ),

                                                                                                                        //Start buttons

                                                                                                                        Row(
                                                                                                                          children: [
                                                                                                                            //Start Cancel button
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                                              child: Column(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                                    child: ElevatedButton(
                                                                                                                                      onPressed: () {
                                                                                                                                        Navigator.of(context).pop();
                                                                                                                                      },
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                                                        child: Text(
                                                                                                                                          'Cancel',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 18,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            color: Colors.white,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            //End Cancel button
                                                                                                                            //Start Pay now button
                                                                                                                            Container(
                                                                                                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                                              child: Column(
                                                                                                                                children: [
                                                                                                                                  ClipRRect(
                                                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                                                    child: ElevatedButton(
                                                                                                                                      onPressed: () async {
                                                                                                                                        // Calculate the total
                                                                                                                                        totalCal();

                                                                                                                                        // Get the card number entered by the user
                                                                                                                                        final cardNum = cardNoController.text;
                                                                                                                                        final exp = expController.text;
                                                                                                                                        final cvv = cvvController.text;

                                                                                                                                        // Get available balance
                                                                                                                                        var balance = await getAvailableBalance(cardNum, exp, cvv);

                                                                                                                                        if (balance >= total) {
                                                                                                                                          // Sufficient balance, proceed with the payment

                                                                                                                                          post();
                                                                                                                                          balance = balance - total;
                                                                                                                                          updateBalance(cardNum, balance);
                                                                                                                                          print('Payment successful');
                                                                                                                                        } else {
                                                                                                                                          // Insufficient balance
                                                                                                                                          print('Insufficient balance');
                                                                                                                                        }
                                                                                                                                      },
                                                                                                                                      child: Padding(
                                                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                                                        child: Text(
                                                                                                                                          'Pay now',
                                                                                                                                          style: TextStyle(
                                                                                                                                            fontSize: 18,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            color: Colors.white,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            //End Pay now button
                                                                                                                          ],
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
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsets.only(left: 8, right: 8),
                                                                                                        child: Text(
                                                                                                          'Order',
                                                                                                          style: TextStyle(
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            color: Colors.white,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),

                                                                                            //End Order button
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      //End buttons
                                                                                      SizedBox(
                                                                                        height: 10,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ));
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Text(
                                                                  'Buy now',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              color: Colors
                                                                  .blueAccent,
                                                              textColor:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                //End Buy button
                                              ],
                                            ),
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
                        //End Items Selection
                        
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
