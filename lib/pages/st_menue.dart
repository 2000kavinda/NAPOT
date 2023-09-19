import 'package:flutter/material.dart';

class StMenu extends StatelessWidget {
  const StMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            //First Row Start
            Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Start button
                InkWell(
                  onTap: () {
                    // Navigate to another page when container is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnotherPage()),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 57, 117, 222),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/search.png',
                                width: 40,
                                height: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search Students',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //end of buton
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),

                //Start button
                InkWell(
                  onTap: () {
                    // Navigate to another page when container is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnotherPage()),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 25, 52, 97),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: MediaQuery.sizeOf(context).width * 0.48,
                    height: MediaQuery.sizeOf(context).height * 0.12,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/profile1.png',
                                width: 40,
                                height: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Lecturer Profile',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //end of buton
              ],
            ),

            //End of First Row
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),

            //Start of Second Row
            Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Start button
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigate to another page when container is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnotherPage()),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 44, 80, 141),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: MediaQuery.sizeOf(context).width * 0.32,
                        height: MediaQuery.sizeOf(context).height * 0.24,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/calendar.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Time Table',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //end of buton
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Second Row Second Column Start
                Column(
                  children: [
                    Row(
                      children: [
                        //Start button
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 114, 157, 232),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.64,
                            height: MediaQuery.sizeOf(context).height * 0.12,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/mymodul.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'My Modules',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //end of buton
                      ],
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Row(
                      children: [
                        //Start button
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to another page when container is clicked
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherPage()),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 9, 79, 200),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.31,
                                height:
                                MediaQuery.sizeOf(context).height * 0.11,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/results.png',
                                            width: 50,
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Results',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //end of buton

                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.013,
                        ),

                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to another page when container is clicked
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherPage()),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 81, 109, 157),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.31,
                                height:
                                MediaQuery.sizeOf(context).height * 0.11,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/icons/notifibel.png',
                                                width: 40,
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Notifications',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //End of second Row Second Column
              ],
            ),
            //End of Second Row

            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),

            //Start of Third Row
            Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Start button
                Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to another page when container is clicked
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherPage()),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 63, 128, 242),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.32,
                                height:
                                MediaQuery.sizeOf(context).height * 0.11,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/messages.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Messages',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width*0.013,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to another page when container is clicked
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherPage()),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 35, 83, 165),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.32,
                                height:
                                MediaQuery.sizeOf(context).height * 0.11,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/qna.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Q & A Foum',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigate to another page when container is clicked
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AnotherPage()),
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 99, 134, 194),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                width: MediaQuery.sizeOf(context).width * 0.66,
                                height:
                                MediaQuery.sizeOf(context).height * 0.11,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/calendar.png',
                                            width: 60,
                                            height: 60,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Calendar',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                //end of buton
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Second Row Second Column Start
                Column(
                  children: [
                    //Start button
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 43, 95, 185),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.30,
                            height: MediaQuery.sizeOf(context).height * 0.23,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/library.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Library',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //End of third Row

            Container(
              height: MediaQuery.sizeOf(context).height*0.01,
            ),

            //Start of Forth Row
            Row(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Start button
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 9, 93, 238),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.32,
                            height:
                            MediaQuery.sizeOf(context).height * 0.11,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/outlook.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'OutLook',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 50, 88, 154),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.32,
                            height:
                            MediaQuery.sizeOf(context).height * 0.11,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/shuttle.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Shuttles',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //end of buton
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.013,
                ),
                //Second Row Second Column Start
                Column(
                  children: [
                    //Start button
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 49, 96, 177),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3125,
                            height: MediaQuery.sizeOf(context).height * 0.11,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/office.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Office 365',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          width: MediaQuery.sizeOf(context).width*0.013,
                        ),

                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 22, 99, 232),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.3125,
                            height: MediaQuery.sizeOf(context).height * 0.11,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/canteenicon.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Canteen',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      height: MediaQuery.sizeOf(context).height*0.01,
                    ),

                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to another page when container is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnotherPage()),
                            );
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 101, 145, 221),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.64,
                            height: MediaQuery.sizeOf(context).height * 0.11,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/complains.png',
                                        width: 60,
                                        height: 60,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Complains',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            //End Of Fourth Row
          ],
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('This is another page.'),
      ),
    );
  }
}
