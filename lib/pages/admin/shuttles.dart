import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Shuttles extends StatefulWidget {
  const Shuttles({Key? key}) : super(key: key);

  @override
  State<Shuttles> createState() => _ShuttlesState();
}

class _ShuttlesState extends State<Shuttles> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('buses');

  final  busNoController = TextEditingController();
  final  destinationController = TextEditingController();
  final  driverController = TextEditingController();
  final  stop1Controller = TextEditingController();
  final  stop2Controller = TextEditingController();
  final  stop3Controller = TextEditingController();
  final  stop4Controller = TextEditingController();
  final  stop5Controller = TextEditingController();
  final  stop6Controller = TextEditingController();
  final  stop7Controller = TextEditingController();
  final  time1Controller = TextEditingController();
  final  time2Controller = TextEditingController();
  final  time3Controller = TextEditingController();
  final  time4Controller = TextEditingController();
  final  time5Controller = TextEditingController();
  final  time6Controller= TextEditingController();
  final  time7Controller =TextEditingController();
  final  vehicleNoController =TextEditingController();

  void _updateData(String docId) {

    collectionReference.doc(docId).update({
      "busNo": busNoController.text,
      "destination": destinationController.text,
      "driver": driverController.text,
      "stop1": stop1Controller.text,
      "stop2": stop2Controller.text,
      "stop3": stop3Controller.text,
      "stop4": stop4Controller.text,
      "stop5": stop5Controller.text,
      "stop6": stop6Controller.text,
      "stop7": stop7Controller.text,
      "time1": time1Controller.text,
      "time2": time2Controller.text,
      "time3": time3Controller.text,
      "time4": time4Controller.text,
      "time5": time5Controller.text,
      "time6": time6Controller.text,
      "time7": time7Controller.text,
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
        title: Text('Shuttle Service'),
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
                            busNoController.text = doc['busNo'];
                            destinationController.text = doc['destination'];
                            driverController.text = doc['driver'];
                            stop1Controller.text = doc['stop1'];
                            stop2Controller.text = doc['stop2'];
                            stop3Controller.text = doc['stop3'];
                            stop4Controller.text = doc['stop4'];
                            stop5Controller.text = doc['stop5'];
                            stop6Controller.text = doc['stop6'];
                            stop7Controller.text = doc['stop7'];
                            time1Controller.text = doc['time1'];
                            time2Controller.text = doc['time2'];
                            time3Controller.text = doc['time4'];
                            time4Controller.text = doc['time5'];
                            time5Controller.text = doc['time6'];
                            time6Controller.text = doc['time7'];
                            time7Controller.text = doc['time8'];
                            vehicleNoController.text = doc['time8'];

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
                                            "Bus Route",
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
                                          controller: destinationController,
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
                                            "Shuttle Number",
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
                                          controller: busNoController,
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
                                            "Vehicle Number",
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
                                          controller: vehicleNoController,
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
                                            "Driver",
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
                                          controller: driverController,
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
                                            "Stop 01",
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
                                          controller: stop1Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 01",
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
                                          controller: time1Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 02",
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
                                          controller: stop2Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 02",
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
                                          controller: time2Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 03",
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
                                          controller: stop3Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 03",
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
                                          controller: time3Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 04",
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
                                          controller: stop4Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 04",
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
                                          controller: time4Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 05",
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
                                          controller: stop5Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 05",
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
                                          controller: time5Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 06",
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
                                          controller: stop6Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 06",
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
                                          controller: time6Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Stop 07",
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
                                          controller: stop7Controller,
                                          keyboardType: TextInputType.text,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                          ),
                                        ),SizedBox(
                                          height: 15,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Arrival time 07",
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
                                          controller: time7Controller,
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
