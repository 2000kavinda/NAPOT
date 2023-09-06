import 'package:flutter/material.dart';

class addItem extends StatelessWidget {
  const addItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Add new item"),
            Icon(
              Icons.logout
            )
          ],
        ),
      ),
    );
  }
}
