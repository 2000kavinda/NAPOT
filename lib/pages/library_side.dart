import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class RoomRequest extends StatefulWidget {
  const RoomRequest({super.key});

  @override
  State<RoomRequest> createState() => _RoomRequestState();
}

class _RoomRequestState extends State<RoomRequest> {
  List<Map<String, dynamic>> imageList = [
    {
      "id": 1,
      "image_path": 'assets/images/banner1.png',
      "text": 'LEAD TOWARD\nSUCCESS\nNSBM',
    },
    {
      "id": 2,
      "image_path": 'assets/images/banner2.png',
      "text": 'EMPOWER YOUR\nHIGHER EDUCATIONAL\nEXPECTATIONS',
    },
    {
      "id": 3,
      "image_path": 'assets/images/banner3.png',
      "text": 'BUILD YOUR\nCORPORATE\nCAREER',
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Room Requests'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        //corasel start
        child: Column(children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  print(currentIndex);
                },
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 40, left: 5),
                                    child: Text(
                                      item['text'] ?? '',
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselIndicator(
                      count: imageList.length,
                      index: currentIndex,
                    ),
                  ],
                ),
              ),
            ],
          ),

          //corasel end

          SizedBox(height: 10), // Add some space between image and columns
          
          //start booking request
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //start first request
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request

                  SizedBox(
                    height: 6,
                  ),
                  
                  //start request
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request
                  SizedBox(
                    height: 6,
                  ),
                  
                  //start request
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request
                  SizedBox(
                    height: 6,
                  ),
                  

                  //start request
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request
                  SizedBox(
                    height: 6,
                  ),
                  

                  //satrt request
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request
                  SizedBox(
                    height: 6,
                  ),

                  //start of request

                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              color: Colors.blueAccent,
                              child: Center(
                                child: Text(
                                  '01',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Container(
                            color: Colors.black12,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name: Hiran Kavindu',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID: 22855',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Time Period: 08.00 AM - 12.00 PM',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //end of request
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int count;
  final int index;
  final double dotSize;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;

  CarouselIndicator({
    required this.count,
    required this.index,
    this.dotSize = 10,
    this.spacing = 8,
    this.activeColor = const Color.fromARGB(255, 255, 255, 255),
    this.inactiveColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> indicators = [];

    for (int i = 0; i < count; i++) {
      indicators.add(
        Container(
          width: dotSize,
          height: dotSize,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == index ? activeColor : inactiveColor,
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }
}
