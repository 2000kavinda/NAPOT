import 'package:flutter/material.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';

class SearchStudent extends StatefulWidget {
  //const SearchStudent({super.key});

  @override
  State<SearchStudent> createState() => _SearchStudentState();
}

class _SearchStudentState extends State<SearchStudent> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Student'),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        //color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Student name or ID",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'inter',
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                const SizedBox(),
                //
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.grey[200], // Grey fill color
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Set the border color when focused
                      borderRadius: BorderRadius.circular(
                          11), // Circular border with radius 11
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .grey), // Set the border color when not focused
                      borderRadius: BorderRadius.circular(
                          11), // Circular border with radius 11
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ), // Adjust the vertical and horizontal padding as needed
                  ),
                ),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
