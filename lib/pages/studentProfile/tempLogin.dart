import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/studentProfile/allBadges.dart';
import 'package:untitled1/pages/studentProfile/allCertificates.dart';
import 'package:untitled1/pages/studentProfile/marks.dart';
import 'package:untitled1/pages/studentProfile/personalData.dart';
//import 'package:untitled1/pages/canteenStudent/MyOrders.dart';

class TempLogin extends StatefulWidget {
  const TempLogin({super.key});

  @override
  State<TempLogin> createState() => _TempLoginState();
}

class _TempLoginState extends State<TempLogin> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 86,),
          TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Enter index',
              border: OutlineInputBorder(),
            ),
          ),
          MaterialButton(

            onPressed: () {
              // Show a search dialog
              String textValue = searchController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Marks(textValue: textValue),
                ),
              );

            },

            child: Text(
              'Sign in',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.green,
            textColor: Colors.white,
            minWidth: 150,
            height: 50,
          ),
        ],
      ),
    );
  }
}