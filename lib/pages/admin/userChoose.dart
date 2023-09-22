import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/signInA.dart';
import 'package:untitled1/pages/canteenAdmin/signInC.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/libraryAdmin/signInL.dart';
import 'package:untitled1/pages/studentProfile/marks.dart';

class TempLogin2 extends StatefulWidget {
  const TempLogin2({super.key});

  @override
  State<TempLogin2> createState() => _TempLogin2State();
}

class _TempLogin2State extends State<TempLogin2> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 86,),
          MaterialButton(

            onPressed: () {
              // Show a search dialog
              String textValue = searchController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInA(),
                ),
              );

            },

            child: Text(
              'Administrator',
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
          SizedBox(height: 50,),
          MaterialButton(

            onPressed: () {
              // Show a search dialog
              String textValue = searchController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInL(),
                ),
              );

            },

            child: Text(
              'Librarian',
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

          SizedBox(height: 30,),
          MaterialButton(

            onPressed: () {
              // Show a search dialog
              String textValue = searchController.text;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInC(),
                ),
              );

            },

            child: Text(
              'Canteen',
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
