import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canteen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CanteenScreen(),
    );
  }
}

class CanteenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Canteen')),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.blue),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Today\'s Special',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCircleContainer('assets/chicken_curry.jpg'),
                _buildCircleContainer('assets/chicken_fried_rice.jpg'),
                _buildCircleContainer('assets/mix_fried_rice.jpg'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOrderButton('Black Chicken Curry'),
                _buildOrderButton('Chicken Fried Rice'),
                _buildOrderButton('Mix Fried Rice'),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Food Items',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildItemsList(['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5']),
            SizedBox(height: 30),
            Text(
              'Drinks and Smoothies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildItemsList(['Drink 1', 'Drink 2', 'Drink 3']),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleContainer(String imagePath) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildOrderButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // Implement order functionality
      },
      style: ElevatedButton.styleFrom(primary: Colors.green),
      child: Text('Order Now: $text'),
    );
  }

  Widget _buildItemsList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: items.map((item) => ListTile(title: Text(item))).toList(),
    );
  }
}
