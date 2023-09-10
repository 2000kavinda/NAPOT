import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class Add_new_items extends StatefulWidget {
  const Add_new_items({super.key});

  @override
  State<Add_new_items> createState() => _Add_new_itemsState();
}

class _Add_new_itemsState extends State<Add_new_items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new item'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
    );
  }
}