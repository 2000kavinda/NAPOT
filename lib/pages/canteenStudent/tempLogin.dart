import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/marks/marks.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 370,
              child: Image.asset(
                'assets/images/loginImg.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Student ID Verify',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Please Enter Your ID',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    bottom: 5,
                  ),
                  child: Text(
                    'Student ID',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: TextField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.black12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                onPressed: () {
                  String textValue = searchController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyOrders(textValue: textValue),
                    ),
                  ); // Call loginUser here
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
            ),
          ],
        ),
      ),
    );
  }
}
