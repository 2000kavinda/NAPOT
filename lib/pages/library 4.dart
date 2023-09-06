import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class roombooking2 extends StatelessWidget {
  const roombooking2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Library Room Booking'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Add a SizedBox for spacing
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Name', // Your text goes here
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(height: 5), // Add spacing between text and box
          Align(
            alignment: Alignment.centerLeft, // Align the box to the left
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    1.0, // Take the full width of the screen
                height: 34, // Set the height of the box
                color: Colors.grey, // Color of the box
                child: Center(
                  child: Text(
                    'This is a box',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
           Text (
        'Student ID',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black),),
        ],
      ),

     
    );
  }
}
