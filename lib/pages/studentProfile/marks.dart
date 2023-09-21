import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';

class Marks extends StatefulWidget {
  //const Marks({Key? key}) : super(key: key);
  final String textValue;
  Marks({required this.textValue});

  @override
  State<Marks> createState() => _MarksState();
}

class _MarksState extends State<Marks> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('marks');

  final  idController = TextEditingController();
  final  ysController = TextEditingController();
  final  moduleController = TextEditingController();
  final  gradeController = TextEditingController();


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
        title: Text('Marks'),
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

                      title: Text(doc['ys']),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['module']),
                          Text(doc['grade']),

                        ],
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
