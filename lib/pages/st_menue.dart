import 'package:flutter/material.dart';
import 'package:untitled1/pages/calendar.dart';
import 'package:untitled1/pages/lectureTimeTable/lecTimeTable.dart';
import 'package:untitled1/pages/messagerPage/message.dart';
import 'package:untitled1/pages/q&a/allQA.dart';
import 'package:untitled1/pages/shuttleService/shuttle.dart';
import 'package:untitled1/pages/submitpage.dart';
import 'package:url_launcher/url_launcher.dart';

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
                                'assets/icons/QR.png',
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
                                'QR Scanner',
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
                                'Student Profile',
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
                              builder: (context) => LectureTimeTable()),
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
                          onTap: () async{
                            final url = 'https://nlearn.nsbm.ac.lk/login/index.php';

                            if(await canLaunch(url)){
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: true,
                                enableJavaScript: true,

                              );
                            }
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
                                      builder: (context) => Message()),
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
                                      builder: (context) => AllQA()),
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
                                      builder: (context) => Calendar()),
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
                          onTap: () async{
                            final url = 'https://login.live.com/login.srf?wa=wsignin1.0&rpsnv=16&ct=1695233938&rver=7.0.6737.0&wp=MBI_SSL&wreply=https%3a%2f%2foutlook.live.com%2fowa%2f%3fcobrandid%3dab0455a0-8d03-46b9-b18b-df2f57b9e44c%26nlp%3d1%26deeplink%3dowa%252f%26RpsCsrfState%3debef040f-427f-21ae-4598-f548ad54cc81&id=292841&aadredir=1&CBCXT=out&lw=1&fl=dob%2cflname%2cwld&cobrandid=ab0455a0-8d03-46b9-b18b-df2f57b9e44c';

                            if(await canLaunch(url)){
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: true,
                                enableJavaScript: true,

                              );
                            }
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
                                  builder: (context) => shuttle()),
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
                          onTap: () async{
                            final url = 'https://login.microsoftonline.com/common/oauth2/v2.0/authorize?client_id=4765445b-32c6-49b0-83e6-1d93765276ca&redirect_uri=https%3A%2F%2Fwww.office.com%2Flandingv2&response_type=code%20id_token&scope=openid%20profile%20https%3A%2F%2Fwww.office.com%2Fv2%2FOfficeHome.All&response_mode=form_post&nonce=638308303430403456.NzViMTFjMzQtMzZhNy00YzJjLTllMzYtZDViZGMwNTA5M2UyODcyYWY0MjQtYzMzMi00OTM0LThlNTktOTEzMzU1OGZlNWM2&ui_locales=en-GB&mkt=en-GB&client-request-id=f59828ad-b6d3-423a-9e54-cc1a3d85fbbe&state=2E-X4NMbRqRbCMwCXfZoVHa7xfOrt9Mr-oQ4oBu4W0wctj_0cXZLY4oNhTTJJP7Dkzkt6gKZmjy60CqnrALoxgTzRLtn8pOsB1pazzhvLMKqBzumrWIEiPNoznYQJw9pzXsZ7ymcacfrehDkMhS9DsJzu7rzwVdYK4uu0Izcd4ZRka2fLUwKKHpZ9tAQ1O64ZC12kso_ZJVqPZ14hDlYkpOIFHid6uIVTIx-lk7-Qu6Q-Z3YPq4gZE08UAkiUAjkrFBQXbxUcz4z8F7sYguK4MNK288aDytzp3IpwGdWsZ8&x-client-SKU=ID_NET6_0&x-client-ver=6.30.1.0';

                            if(await canLaunch(url)){
                              await launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: true,
                                enableJavaScript: true,

                              );
                            }
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