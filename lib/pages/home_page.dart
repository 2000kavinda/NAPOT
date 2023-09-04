import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
        title: Text(
          'NAPOT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            iconSize: 30,
          ),
        ],
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          iconSize: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Add your button click logic here
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Image.asset(
                              'assets/icons/degreeIcon.png', // Replace with the actual path to your PNG image
                              color: Colors
                                  .white, // Optional: You can adjust the color if needed
                            ),
                          ),
                          SizedBox(
                              height:
                              8), // Adjust the spacing between the button and text
                          Text(
                            'Next Intake',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InkWell(
                      onTap: () {
                        // Add your button click logic here
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Image.asset(
                              'assets/icons/postGraduates.png', // Replace with the actual path to your PNG image
                              color: Colors
                                  .white, // Optional: You can adjust the color if needed
                            ),
                          ),
                          SizedBox(
                              height:
                              8), // Adjust the spacing between the button and text
                          Text(
                            'Post Graduate',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InkWell(
                      onTap: () {
                        // Add your button click logic here
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Image.asset(
                              'assets/icons/facilities.png', // Replace with the actual path to your PNG image
                              color: Colors
                                  .white, // Optional: You can adjust the color if needed
                            ),
                          ),
                          SizedBox(
                              height:
                              8), // Adjust the spacing between the button and text
                          Text(
                            'Facilities',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InkWell(
                      onTap: () {
                        // Add your button click logic here
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Image.asset(
                              'assets/icons/virtualTour.png', // Replace with the actual path to your PNG image
                              color: Colors
                                  .white, // Optional: You can adjust the color if needed
                            ),
                          ),
                          SizedBox(
                              height:
                              8), // Adjust the spacing between the button and text
                          Text(
                            'Virtual Tour',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Latset news',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 272,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/Picture1.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              padding: EdgeInsets.only(top: 140, left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          'assets/images/rectangle1.png'),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Second Chapter\nof Economic\nKnowledge Park',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'The Economic Knowledge\nPark 2.0 – The journey around\nthe world of economies” is an\nacademic exhibition\norganised by 22.2 ',
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 163,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/pic2.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: EdgeInsets.only(top: 65, left: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/rectangle2.png'),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            'Yakari Street Food\nFestival 2023',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'The Economic Knowledge Park 2.0 –\nThe journey around the world of\neconomies” is an academic\nexhibition organized by 22.2 ',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 109,
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/pic3.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  padding: EdgeInsets.only(top: 50, left: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/images/rectangle3.png'),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Annual General Meeting of \nYoung Scientists'
                                                ' Circle',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'The Annual General Meeting of the\nYoung Scientists’ Circle of the Faculty ',
                                            style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'Affiliated Universities',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            'As Sri Lanka’s International University, NSBM is constantly looking for international recognition through strategic linkages with international institutes. Partnering strength to strength with esteemed international partners, NSBM commits to stay at the forefront as a provider of world-class higher education, introducing foreign academic programmes with high market value offered by top-class foreign universities worldwide.',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //Plymouth University bar

            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 75,
                  color: Colors.grey,
                  child: Image.asset('assets/images/plyBatch.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 75,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 12),
                    child: Text(
                      'University of Plymouth\nEngland',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),

            //University details Start
            //plumouth University Details
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 108,
                  child: Row(
                    children: [
                      Image.asset('assets/images/plyImage.png'),
                    ],
                  ),
                ),
                Container(
                  height: 108,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'The University of Plymouth, one of the largest universities in the UK, is among the highest-ranked modern higher education institutions in the world and twice winner of the Queen’s Anniversary Prize for Higher and Further Education.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10,
            ),

            //Victorial University Section
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 75,
                  color: Colors.grey,
                  child: Image.asset('assets/images/victoriaLogo.png'),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 75,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 12),
                    child: Text(
                      'Victoria University\nAustralia',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6,
            ),
            //Victoria University Details Section
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 108,
                  child: Row(
                    children: [
                      Image.asset('assets/images/victoriaUni.png'),
                    ],
                  ),
                ),
                Container(
                  height: 108,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'Victoria University (VU) is an Australian public university which is ranked in the top three percent of all universities worldwide (THE World University Rankings 2023) and in the top 80 universities under 50 years old.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            //University details End

            SizedBox(
              height: 20,
            ),

            //About Courses Section Start

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'About Courses',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: Text(
                  'athering momentum from the promising journey over the past successful years, NSBM sets the green university experience to the next level with the Phase II. This giant step in crafting a future of greater impact gives unwavering faith to envision the university’s vision and purpose from a broader perspective. The Phase 2 developments in another 15 acres of land adjoining the existing premises are currently in progress and believed ',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            //end of About Courses section
            SizedBox(
              height: 20,
            ),

            //UnderGraduate button start
            ElevatedButton(
              onPressed: () {
                // Add your button's functionality here
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
                          'Undergraduate',
                          style: TextStyle(
                            fontSize: 18,
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
            //UnderGraduate button end

            SizedBox(
              height: 15,
            ),
            //Post Graduate Start
            ElevatedButton(
              onPressed: () {
                // Add your button's functionality here
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
                          'Post Graduate',
                          style: TextStyle(
                            fontSize: 18,
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
            //post graduate end

            SizedBox(
              height: 15,
            ),
            //Phd start
            ElevatedButton(
              onPressed: () {
                // Add your button's functionality here
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
                          'PHD',
                          style: TextStyle(
                            fontSize: 18,
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

            //Beauty of NSBM section

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Beauty of NSBM',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            //Beauty of NSBM End


            SizedBox(
              height: 15,
            ),

            //beuty of NSBM photo Section
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    // Handle onTap action for Container 1
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 272,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/beuty1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: EdgeInsets.only(top: 180, left: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Image.asset('assets/images/rectangle1.png'),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      'Faculty of business',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    'The Faculty of Business of NSBM is the ideal faculty for any undergraduate interested in pursuing a career in the Business field.',
                                    style: TextStyle(fontSize: 10, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 163,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Image.asset(
                                'assets/images/beauty03.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(top: 78, left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          child: Image.asset(
                                              'assets/images/rectangle2.png'),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'Main entrance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.45,
                                          child: Text(
                                            'The Faculty of Business of NSBM is the ideal faculty for any undergraduate interested in pursuing a career in the Business field.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 109,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/beauty4.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.only(top: 50, left: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                            'assets/images/rectangle3.png'),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Annual General Meeting of \nYoung Scientists'
                                              ' Circle',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'The Annual General Meeting of the\nYoung Scientists’ Circle of the Faculty ',
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    '                                       Gathering momentum from the promising journey over the past successful years, NSBM sets the green university experience to the next level with the Phase II. This giant step in crafting a future of greater impact gives unwavering faith to envision the university’s vision and purpose from a broader perspective. The Phase 2 developments in another 15 acres of land adjoining the existing premises are currently in progress and believed ',
                    style: TextStyle(
                        fontSize: 13
                    ),
                  ),
                ),
              ],
            ),
            //End of beauty of NSBM Part
          ],
        ),
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

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
