import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled1/pages/canteenStudent/allItems.dart';
import 'package:untitled1/pages/canteenStudent/tempLogin.dart';
import 'package:untitled1/pages/eventPage/event.dart';
import 'package:untitled1/pages/home_page.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';
import 'package:untitled1/pages/libraryAdmin/addRoom.dart';
import 'package:untitled1/pages/libraryAdmin/allBookings.dart';
import 'package:untitled1/pages/libraryAdmin/availbleRooms.dart';
import 'package:untitled1/pages/libraryAdmin/libraryRooms.dart';
import 'package:untitled1/pages/st_menue.dart';

class BottomBarLibraryAdmin extends StatefulWidget {
  const BottomBarLibraryAdmin({super.key});

  @override
  State<BottomBarLibraryAdmin> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBarLibraryAdmin> {

  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    
    availableRoomsAdmin(),
    allBookings(),
    AddRoom(),
    libraryRooms(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: GNav(
            backgroundColor: Colors.blueAccent,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.blue.shade800,
            gap: 8,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.list,
                text: 'Availability',
              ),
              GButton(
                icon: Icons.timelapse,
                text: 'Bookings',
                ),
              GButton(
                icon: Icons.add,
                text: 'Add new',
                ),
              GButton(
                icon: Icons.edit,
                text: 'Update',
                ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            iconSize: 30,
            ),
        ),
      ),
    );
  }
}