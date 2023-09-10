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
    ):
  }
}
