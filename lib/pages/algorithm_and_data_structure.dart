import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class algo_data extends StatefulWidget {
  const algo_data({super.key});

  @override
  State<algo_data> createState() => _algo_dataState();
}

class _algo_dataState extends State<algo_data> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm and data structure'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                builbuttons(),
                SizedBox(height: 20),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(47, 220, 73, 0.688)),
                ),
                Text(
                  'Algorithm and data structure',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  '"To become a good programmer, you can keep programming for two years continually. To become a world-class programmer, you can either keep programming for another 8 years continually or take an algorithms class." - Popular Saying',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  color: Colors.blueAccent,
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Lecture 01 :   Introduction',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                //
                Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 11, 209, 44),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/kfl.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 8), // Add spacing between the image and text
                    Expanded(
                      child: Text(
                        'L1  Introduction to data Structures algorithm',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Checkbox(
                      value: isChecked,
                      activeColor: Colors.orangeAccent,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        //height: 62,
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
          child: GNav(
              backgroundColor: Colors.blueAccent,
              color: Colors.white,
              activeColor: Colors.white,
              gap: 8,

              //tabBackgroundColor: Colors.grey.shade500,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'notification',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'profile',
                ),
                GButton(icon: Icons.home),
              ]),
        ),
      ),
    );
  }

  Widget builbuttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(99, 35),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Add new',
            style: TextStyle(fontSize: 14),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(99, 35),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Edit',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
