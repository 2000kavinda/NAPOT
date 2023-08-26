import 'package:flutter/material.dart';

class Attendance extends StatelessWidget {
  const Attendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
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

            //Start of semester Attendance Section
            SizedBox(
              height: 10,
            ),
            // Start semester bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blueAccent,
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  child: Center(
                    child: Text(
                      '3rd Year 1st Semester',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // End of semester bar
            SizedBox(
              height: 20,
            ),
            
            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.3, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.4, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.5, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.7, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.8, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section
            //end of Semester Module Attendance Section

            //Start of semester Attendance Section
            SizedBox(
              height: 10,
            ),
            // Start semester bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blueAccent,
                  width: MediaQuery.of(context).size.width,
                  height: 38,
                  child: Center(
                    child: Text(
                      '2nd Year 2nd Semester',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // End of semester bar
            SizedBox(
              height: 20,
            ),
            
            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.8, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.7, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.6, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.4, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section

            SizedBox(
              height: 10,
            ),

            //Start Module Section 
            Container(
              child: Column(
                children: [
                  //Start of the Module name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          'Mobile Application Development',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the module name

                  SizedBox(height: 5), // Adding some spacing

                  // Progress bar with increased height
                  Container(
                    height: 16,
                    width: MediaQuery.sizeOf(context).width*0.9, // Adjust this value to increase/decrease the height
                    child: LinearProgressIndicator(
                      value: 0.5, // Set the progress value between 0.0 and 1.0
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //Start the Persenage of module progress
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width*0.9,
                        child: Text(
                          '70%',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  //end of the persentage of module progress
                ],
              ),
            ),
            //end of module section
            //end of Semester Module Attendance Section

          ],
        ),
      ),
    );
  }
}