import 'package:flutter/material.dart';
import 'package:untitled1/pages/admin/addMarks.dart';
import 'package:untitled1/pages/admin/addShuttle.dart';
import 'package:untitled1/pages/admin/pendingApproves.dart';
import 'package:untitled1/pages/admin/shuttles.dart';
import 'package:untitled1/pages/admin/signInA.dart';
import 'package:untitled1/pages/canteenAdmin/signInC.dart';
import 'package:untitled1/pages/canteenStudent/MyOrders.dart';
import 'package:untitled1/pages/libraryAdmin/signInL.dart';

class AdminController extends StatefulWidget {
  const AdminController({super.key});

  @override
  State<AdminController> createState() => _TempLogin2State();
}

class _TempLogin2State extends State<AdminController> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: () {
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMarks(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Add Marks',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                // Show a search dialog
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShuttlesAdmin(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Edite Shuttles',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: () {
                // Show a search dialog
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddBus(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Add Shuttle',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),


            ElevatedButton(
              onPressed: () {
                // Show a search dialog
                String textValue = searchController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PendingApproves(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Pending Approvals',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/icons/back.png'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            


            
          ],
        ),
      ),
    );
  }
}
