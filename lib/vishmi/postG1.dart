import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatefulWidget {
  TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  final List<String> imagePaths = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
  ];

  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Start a timer to automatically scroll images
    startTimer();
  }

  @override
  void dispose() {
    // Dispose of the page controller when not needed
    _pageController.dispose();
    super.dispose();
  }

  void startTimer() {
    // Set up a timer to automatically scroll to the next page
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentPage < imagePaths.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55), // Set the height of the AppBar
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Add your menu button's onPressed logic here
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Add your search button's onPressed logic here
                  },
                ),
              ],
              title: const Text('Post Graduates'),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255, 64, 156, 255),
            ),
          ),
          body: Column(
            children: [
              // Your image bar with swapping images
              Container(
                height: 250, // Set the height of the image bar
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imagePaths.length,
                  onPageChanged: (index) {
                    // Update the current page when the page changes manually
                    currentPage = index;
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              // The card with text and button
              Expanded(
                child: ListView(
                  children: [
                    Card(
                      color: Color.fromARGB(255, 227, 235, 239),
                      elevation: 4,
                      margin: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Center(
                            child: Text(
                              'POST GRADUATE SUCCESS STORIES',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Click below to see',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Add your button click logic here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIcon(Icons.facebook),
                              _buildSocialIcon(Icons.location_city),
                              _buildSocialIcon(Icons.email),
                              _buildSocialIcon(Icons.phone),
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(
                  Icons.home,
                  size: 35,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  size: 35,
                ),
                label: 'bell',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view_rounded,
                  size: 35,
                ),
                label: 'grid',
              ),
              // Add more BottomNavigationBarItems for other tabs
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData iconData) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: Colors.white,
        ),
        onPressed: () {
          // Add your social media icon onPressed logic here
        },
      ),
    );
  }
}
