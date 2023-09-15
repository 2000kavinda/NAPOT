import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> cardTexts = [
      'Modern classrooms, lecture halls and computer laboratories are available for conducting academic programs as well as professional training. These facilities are equipped with modern audio-visual equipment and other related infrastructural facilities on par with international standards.',
      'NSBM library has a resourceful collection of books in the fields of management, computing, engineering and Science. The library is also equipped with a modern sit-and-read facility and computers that allow students to browse the internet free of charge. All students of NSBM are eligible to use the library facility and upon obtaining the membership, they can borrow books and periodicals.',
      'NBSM is a very supportive environment for the co-curricular activities of students. They are encouraged to get involved in the organizing of social activities, charity work, activities pertaining to their own personality development and networking to mould them into skilled degree holders.Students involvement in sports, societies and event organizing is always encouraged.',
      'NSBM provides a comprehensive IT infrastructure in support of teaching and conducting practical sessions.Students are expected to use computer labs according to the schedules given and the use of IT resources should comply with the IT policy of NSBM.',
      'On-campus accommodation at NSBM Green University is made with international standards giving students comfort, relaxation and convenience. Each accommodation unit is equipped with all necessary facilities required for the students and allocation will be done on twin sharing basis.Facilities and features:Fully furnished rooms with bed, table and chair wardrobe and towel rack.',
      'NSBM recreational building consists of a swimming pool with 6 lanes, and a multi-purpose indoor sports building including a basketball court, badminton court and a table tennis court. A gymnasium, outdoor sports ground, cricket nets and an observation deck, pavilion and tiered seating for over 600 average spectators.',
      'Apart from public and private transport services, a limited shuttle service is available during the peak hours between High-Level Road and NSBM Green University.These buses provide transport to students at affordable rates in a pre-defined schedule.',
      'NSBM LMS provides a rich source of subject-related content for students. Upon registration, you will be provided with the required credentials to access the LMS.You are encouraged to utilize the resources available in the LMS; read the module descriptors and lecture material well in advance and prepare before attending the lectures to realize your full potential.',
    ];

    final List<String> cardTitles = [
      'Lecture Halls',
      'Library',
      'Co-Curricular Activities',
      'IT Laboratory',
      'Student Accommodation',
      'Recreational Facilities',
      'NSBM Shuttle Service',
      'NSBM Learning Management System',
    ];

    final List<String> imagePaths = [
      'assets/images/crowd.png',
      'assets/images/girl1.png',
      'assets/images/girl2.png',
      'assets/images/lec.png',
      'assets/images/beds.png',
      'assets/images/spor.png',
      'assets/images/bus.png',
      'assets/images/lab.png',
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_rounded),
              onPressed: () {
                // Add your menu button's onPressed logic here
              },
            ),
            title: const Text('Facilities'),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 64, 156, 255),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, // 2 columns
              crossAxisSpacing: 1.0, // Horizontal spacing
              mainAxisSpacing: 8.0,
               // Vertical spacing
            ),


            itemCount: 8, // Display 8 cards
            itemBuilder: (context, index) {
              return RoundedGridCard(
                imagePath: imagePaths[index],
                title: cardTitles[index],
                text: cardTexts[index],
              );
            },
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
}

class RoundedGridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String text;

  const RoundedGridCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 0, 136, 248), // Blue background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add your card content here
          // For example, you can add an image, text, and buttons
          // Customize the content as needed
          Image.asset(
            imagePath,
            width: double.infinity, // Width of the image
            height: 142,
            fit: BoxFit.fitWidth, // Height of the image
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Add any desired styling
                color: Colors.white, // Text color
              ),
            ),
          ),




          
          Padding(
            padding: const EdgeInsets.all(8.0), // Adjust padding as needed
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Add any desired styling
                color: Colors.white, // Text color
              ),
            ),
          ),
          // Add more widgets like text and buttons here
        ],
      ),
    );
  }
}
