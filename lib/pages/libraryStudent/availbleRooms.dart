import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/web/web_icon_generator.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/libraryStudent/bookRoomClass.dart';

class availableRooms extends StatefulWidget {
  const availableRooms({Key? key}) : super(key: key);

  @override
  State<availableRooms> createState() => _availableRoomsState();
}

class _availableRoomsState extends State<availableRooms> {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('libraryRooms');
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('libraryBookings');

  final roomNoController = TextEditingController();
  final countController = TextEditingController();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final sCountController = TextEditingController();
  final purposeController = TextEditingController();
  final fromController = TextEditingController();
  final toController = TextEditingController();

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

  void post() async {
    String roomNo = roomNoController.text;
    String count = countController.text;
    String name = nameController.text;
    String id = idController.text;
    String sCount = sCountController.text;
    String purpose = purposeController.text;
    String from = fromController.text;
    String to = toController.text;

    String resp = await Stored().saved(
      roomNo: roomNo,
      count: count,
      name: name,
      id: id,
      scount: sCount,
      purpose: purpose,
      from: from,
      to: to,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library Room Booking',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //Start Available rooms banner
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 40,
            color: Colors.blueAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Available Rooms',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //End Available rooms banner

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
                        SizedBox(
                          height: 10,
                        ),
                        //Start Room Details
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.95,
                          height: 100,
                          color: Colors.black12,
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                height: 40,
                                color: Colors.blueAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Room Number ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      doc['roomNo'],
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
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.475,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Student Capacity : ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              doc['count'],
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.475,
                                      child: Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              roomNoController.text =
                                                  doc['roomNo'];
                                              countController.text =
                                                  doc['count'];

                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    FullScreenDialog(
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                    .sizeOf(
                                                                        context)
                                                                .width,
                                                            height: 50,
                                                            color: Colors
                                                                .blueAccent,
                                                            child: Row(
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.2,
                                                                  child:
                                                                      IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Icon(Icons
                                                                        .arrow_back_ios),
                                                                    iconSize:
                                                                        25,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(context).width*0.8,
                                                                  child: Text('Fill the details',
                                                                  style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.white,
                                                                  ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Column(
                                                              children: [
                                                                SizedBox(
                                                                  height: 25,
                                                                ),
                                                                //Start Room Number
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Room number',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                roomNoController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Room number

                                                                //Start Capacity
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Capacity',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                countController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Capacity

                                                                //Start Name
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Name',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                nameController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Name

                                                                //Start Student ID
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Student ID',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                idController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Student ID

                                                                //Start Number of Students
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Number of Students',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                sCountController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Number of Students

                                                                //Start Purpose
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Purpose',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                purposeController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End Purpose
                                                                SizedBox(
                                                                  height: 20,
                                                                ),

                                                                //Start Time Duration bar
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  height: 40,
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Time Duration',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                //End Time Duration bar
                                                                SizedBox(
                                                                  height: 20,
                                                                ),

                                                                //Start From
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'From',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                fromController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End From

                                                                //Start To
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .only(
                                                                        left:
                                                                            10,
                                                                        bottom:
                                                                            5,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'To',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                10,
                                                                            right:
                                                                                10),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              TextField(
                                                                            controller:
                                                                                toController,
                                                                            keyboardType:
                                                                                TextInputType.text,
                                                                            decoration:
                                                                                const InputDecoration(
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
                                                                  height: 20,
                                                                ),
                                                                //End To

                                                                //Start buttons
                                                                Row(
                                                                  children: [
                                                                    //Start Cancel
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              // Delete operation

                                                                              Navigator.of(context).pop(); // Close the dialog
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Cancel',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            color:
                                                                                Colors.blue,
                                                                            textColor:
                                                                                Colors.white,
                                                                            minWidth:
                                                                                100,
                                                                            height:
                                                                                40,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    //End Cancel

                                                                    //Start Submit
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          MaterialButton(
                                                                            onPressed:
                                                                                () {
                                                                              // Update operation
                                                                              post();
                                                                              collectionReference.doc(docId).delete().then((_) {
                                                                                Navigator.of(context).pop(); // Close the dialog
                                                                              }).catchError((error) {
                                                                                print("Error deleting document: $error");
                                                                              });
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Submit',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            color:
                                                                                Colors.blue,
                                                                            textColor:
                                                                                Colors.white,
                                                                            minWidth:
                                                                                100,
                                                                            height:
                                                                                40,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    //End Submit
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
                                                ),
                                              );

                                              // Delete operation
                                              /*collectionReference.doc(docId).delete().then((_) {
                                Navigator.of(context).pop(); // Close the dialog
                              }).catchError((error) {
                                print("Error deleting document: $error");
                              });*/
                                            },
                                            child: Text(
                                              'Book now',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            minWidth: 80,
                                            height: 30,
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
                        //End Romm Details
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
