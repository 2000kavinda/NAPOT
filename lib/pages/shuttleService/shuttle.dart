import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/auth_methods.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:carousel_slider/carousel_slider.dart';

class shuttle extends StatefulWidget {
  const shuttle({Key? key}) : super(key: key);

  @override
  State<shuttle> createState() => _shuttleState();
}

class _shuttleState extends State<shuttle> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('buses');

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final degreeController = TextEditingController();
  final passwordController = TextEditingController();
  final indexController = TextEditingController();
  final batchController = TextEditingController();
  final nicController = TextEditingController();

  void registerUser() async {
    String resp = await AuthMethods().registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      degree: degreeController.text,
      index: indexController.text,
      batch: batchController.text,
      nic: nicController.text,
    );
  }
  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "image_path": 'assets/images/banner1.png',
      "text": 'LEAD TOWARD\nSUCCESS\nNSBM',
    },
    {
      "id": 2,
      "image_path": 'assets/images/banner2.png',
      "text": 'EMPOWER YOUR\nHIGHER EDUCATIONAL\nEXPECTATIONS',
    },
    {
      "id": 3,
      "image_path": 'assets/images/banner3.png',
      "text": 'BUILD YOUR\nCORPORATE\nCAREER',
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  /*void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "itemName": itemNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,
      "category": categoryController.text,
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
        title: Text('Shuttle schedule',
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
          //Start Coraousel
          Container(
            child: Column(
              children: [
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(currentIndex);
                        },
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 40, left: 5),
                                        child: Text(
                                          item['text'] ?? '',
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CarouselIndicator(
                              count: imageList.length,
                              index: currentIndex,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          //End Coraousel
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
                  itemCount: items.length * 2 - 1,
                  // Double the item count to account for SizedBox widgets
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
                        SizedBox(
                          height: 10,
                        ),
                        
                        //Start Shuttle details button
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                    context: context,
                                    builder: (context) => FullScreenDialog(
                                      content: Container(
                                        child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              Container(
                                                width: MediaQuery.sizeOf(context).width,
                                                height: 55,
                                                color: Colors.blueAccent,
                                                child: Row(
                                                  
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(context).width*0.1,
                                                      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: Colors.white,
        ),
                                                    ),
                                                    
                                                     
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width*0.9,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 10),
                                                            child: Row(
                                                              
                                                              children: [
                                                                Text('Shuttle ',
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                                ),
                                                                Text(doc['busNo'],
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                                ),
                                                                Text(' - ',
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                                ),
                                                                Text(doc['destination'],
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.white,
                                                                ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          ),
                                                      
                                                  ],
                                                ),
                                              ),
                                              
                                              //Start Coraousel
          Container(
            child: Column(
              children: [
                Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          print(currentIndex);
                        },
                        child: CarouselSlider(
                          items: imageList
                              .map(
                                (item) => Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 40, left: 5),
                                        child: Text(
                                          item['text'] ?? '',
                                          style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                              .toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: const BouncingScrollPhysics(),
                            autoPlay: true,
                            aspectRatio: 2,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CarouselIndicator(
                              count: imageList.length,
                              index: currentIndex,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          //End Coraousel
                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop1'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time1'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details 

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop2'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time2'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details 

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop3'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time3'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop4'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time4'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop5'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time5'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop6'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time6'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details

                                              //Start Route details
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.sizeOf(context).width,
                                                          height: 60,
                                                          
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5,right: 5),
                                                            child: Container(
                                                              color: Colors.black12,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(doc['stop7'],
                                                                        style: TextStyle(
                                                                          fontSize: 16,
                                                                          fontWeight: FontWeight.bold,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(right: 5),
                                                                          child: Text('Time : ',
                                                                          style: TextStyle(
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w500,
                                                                            color: Colors.black87,
                                                                          ),
                                                                          ),
                                                                        ),
                                                                                                                        
                                                                        Text(doc['time7'],
                                                                        style: TextStyle(
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: Colors.black87,
                                                                        ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              //End Route details
                                            ],
                                          ),
                                        
                                      ),
                                    ),
                                  );
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: MediaQuery.sizeOf(context).width*0.25,
                                    height: 130,
                                    color: Colors.blueAccent,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Shuttle',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(doc['busNo'],
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.sizeOf(context).width*0.75,
                                    height: 130,
                                    color: Color.fromARGB(255, 228, 228, 228),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.sizeOf(context).width*0.75,
                                          height: 60,
                                          color: Color.fromARGB(255, 48, 52, 138),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('Bus Route',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                              ),
                                              Text(doc['destination'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4,bottom: 5),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 5),
                                                      child: Text('Vehicle No : ',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black54,
                                                      ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 10,top: 5),
                                                      child: Text(doc['vehicleNo'],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black87,
                                                      ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text('Driver Name',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black54,
                                                    ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(doc['driver'],
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87,
                                                    ),
                                                    ),
                                                  ],
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
                          ),
                          //End Shuttle details button
                        ),
                        
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

class CarouselIndicator extends StatelessWidget {
  final int count;
  final int index;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  CarouselIndicator({
    required this.count,
    required this.index,
    this.dotSize = 10,
    this.spacing = 8,
    this.activeColor = const Color.fromARGB(255, 255, 255, 255),
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];

    for (int i = 0; i < count; i++) {
      indicators.add(
        Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == index ? activeColor : inactiveColor,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}
