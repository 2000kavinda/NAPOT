import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/canteenStudent/ordersAddClass.dart';
import 'package:untitled1/pages/q&a/addQ&a.dart';
import 'package:untitled1/pages/q&a/addQ&aClass.dart';
import 'package:untitled1/pages/q&a/allAnswers.dart';

class AllQA extends StatefulWidget {
  //const addQA({Key? key}) : super(key: key);

  @override
  State<AllQA> createState() => _addQAState();
}

class _addQAState extends State<AllQA> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('qa');
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('qs');

  final qController = TextEditingController();
  final aController = TextEditingController();
  TextEditingController searchController = TextEditingController();

  int total = 0, qty = 0, price = 0;
  var nameToUpdate = "xyz";
  int balance = 0;

  void post() async {
    String q = qController.text;
    String a = aController.text;

    String resp = await StoreQa().saveQa(
      q: q,
      a: a,
    );
  }

  /*void _updateData(String docId) {
    collectionReference.doc(docId).update({
      "itemName": itemNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,
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
        title: Text(
          'Q & A Forum',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddQA()),
              );
            },
            icon: Icon(Icons.add),
            iconSize: 30,
          )
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: reference.snapshots(),
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
                        Container(
                          child: Column(
                            children: [
                              //Start Question
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blueAccent,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.95,
                                      height: 150,
                                      color: Colors.black12,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            doc['q'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                      Icons.question_answer),
                                                  color: Colors.white,
                                                  onPressed: () {
                                                    qController.text = doc['q'];
                                                    //aController.text = doc['a'];

                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          FullScreenDialog(
                                                        content: Container(
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                child: Column(
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      height:
                                                                          50,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.2,
                                                                            child:
                                                                                IconButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              icon: Icon(Icons.arrow_back_ios),
                                                                              iconSize: 25,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.8,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      'Answering Page',
                                                                                      style: TextStyle(
                                                                                        fontSize: 18,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        color: Colors.white,
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

                                                                    SizedBox(
                                                                      height:
                                                                          30,
                                                                    ),

                                                                    //Start Question
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            bottom:
                                                                                5,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Question',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10, right: 10),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              child: TextField(
                                                                                controller: qController,
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
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    //End Question

                                                                    //Start Answers
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(
                                                                            left:
                                                                                10,
                                                                            bottom:
                                                                                5,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Answers',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 10, right: 10),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              child: TextField(
                                                                                 controller:
                                                                        aController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
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
                                                                    SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    //End Answers
                                                                    Container(
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              MaterialButton(
                                                                        onPressed:
                                                                            () {
                                                                          post();
                                                                        },
                                                                        child: Text(
                                                                            'Post',
                                                                            style: TextStyle(
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                            ),
                                                                        color: Colors
                                                                            .blue,
                                                                        textColor:
                                                                            Colors.white,
                                                                        minWidth:
                                                                            100,
                                                                        height:
                                                                            40,
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
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.65,
                                            child: MaterialButton(
                                              onPressed: () {
                                                qController.text = doc['q'];
                                                String textValue =
                                                    qController.text;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AllAnswers(
                                                            textValue:
                                                                textValue),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Answers',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              color: Colors.black26,
                                              textColor: Colors.white,
                                              minWidth: 100,
                                              height: 40,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //End Question
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
