import 'package:flutter/material.dart';

class Result
    extends StatelessWidget {
  const Result
      ({super.key});

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

            //Start of Semester Details
            SizedBox(
              height: 10,
            ),

            //Start semester bar
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
            //end of semester bar

            //Start of subject Name and Result
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result

                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result




                //Start of the pdf download button section
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width*0.4,
                                  child: Text('You can download the pdf by clicking this button',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width*0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                ElevatedButton(onPressed: (){}, child: Text('Download as Pdf'),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end of the pdf download button section
                  ],
                ),
              ],
            ),

            //End Semester details

            SizedBox(
              height: 10,
            ),

            //Start of semester details
            SizedBox(
              height: 10,
            ),

            //Start semester bar
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
            //end of semester bar

            //Start of subject Name and Result
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result

                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result




                //Start of the pdf download button section
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width*0.4,
                                  child: Text('You can download the pdf by clicking this button',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width*0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                ElevatedButton(onPressed: (){}, child: Text('Download as Pdf'),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end of the pdf download button section
                  ],
                ),
              ],
            ),
            //End of semester details


            SizedBox(
              height: 10,
            ),
            //Start of semester details
            SizedBox(
              height: 10,
            ),

            //Start semester bar
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
            //end of semester bar

            //Start of subject Name and Result
            Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result

                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result
                //Start of subject Name and Result
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text('Advanced Mathematics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('A',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //end of Subject name and Result




                //Start of the pdf download button section
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width*0.4,
                                  child: Text('You can download the pdf by clicking this button',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width*0.5,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width*0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [


                                ElevatedButton(onPressed: (){}, child: Text('Download as Pdf'),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //end of the pdf download button section
                  ],
                ),
              ],
            ),
            //End of semester details



          ],
        ),
      ),
    );
  }
}