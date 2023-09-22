import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/studentProfile/marks.dart';

class TempLogin1 extends StatefulWidget {
  const TempLogin1({super.key});

  @override
  State<TempLogin1> createState() => _TempLogin1State();
}

class _TempLogin1State extends State<TempLogin1> {
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
          SizedBox(height: 30,),
          MaterialButton(

                  onPressed: () {
                    // Show a search dialog
                    String textValue = searchController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyOrders(textValue: textValue),
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
