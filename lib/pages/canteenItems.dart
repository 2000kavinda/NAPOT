import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanteenItems extends StatefulWidget {
  const CanteenItems({Key? key}) : super(key: key);

  @override
  State<CanteenItems> createState() => _CanteenItemsState();
}

class _CanteenItemsState extends State<CanteenItems> {
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection('canteenItems');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Canteen Items'),
      ),
      body: StreamBuilder<QuerySnapshot>(
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

              return ListTile(
                title: Text(doc['itemName']),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doc['description']),
                    Text(doc['price']),
                  ],
                ),
                trailing: Image.network(
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
    );
  }
}
