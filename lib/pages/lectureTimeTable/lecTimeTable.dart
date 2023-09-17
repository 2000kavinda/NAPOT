import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LectureTimeTable extends StatefulWidget {
  const LectureTimeTable({super.key});

  @override
  State<LectureTimeTable> createState() => _DemoPageState();
}

class _DemoPageState extends State<LectureTimeTable> {
  final CollectionReference _timetable =
  FirebaseFirestore.instance.collection("timetable");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture Time Table',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
         leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
                      ),
              Container(
                height: 10000,
                child: StreamBuilder(
                  stream: _timetable.snapshots(),
                  builder: (context,AsyncSnapshot snapshots) {
                    if(snapshots.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(color: Colors.green,),
                      );
                    }
                      
                    if (snapshots.hasData){
                      return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, index){
                          final DocumentSnapshot records = snapshots.data!.docs[index];
                        return Column(
                          children: [
                            
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 40,
                              color: Colors.blueAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(records['date'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.38,
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('data',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: MediaQuery.sizeOf(context).width*0.01,
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.6,
                                  height: 40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Lecture',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.38,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6,bottom: 6),
                                    child: Container(
                                      height: 38,
                                      width: MediaQuery.sizeOf(context).width*0.35,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(records['time1'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54
                                          ),
                                          ),
                                        ],
                                      ),
                                      ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.01,
                                  height: 50,
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.6,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6,bottom: 6),
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.55,
                                          height: 38,
                                          decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color: Colors.lightBlue),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(records['lec1'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
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
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.38,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6,bottom: 6),
                                    child: Container(
                                      height: 38,
                                      width: MediaQuery.sizeOf(context).width*0.35,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(records['time1'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54
                                          ),
                                          ),
                                        ],
                                      ),
                                      ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.01,
                                  height: 50,
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.6,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6,bottom: 6),
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.55,
                                          height: 38,
                                          decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color: Colors.green),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(records['lec1'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
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
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.38,
                                  height: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 6,bottom: 6),
                                    child: Container(
                                      height: 38,
                                      width: MediaQuery.sizeOf(context).width*0.35,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(records['time1'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                          ),
                                          ),
                                        ],
                                      ),
                                      ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.01,
                                  height: 50,
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.6,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6,bottom: 6),
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width*0.55,
                                          height: 38,
                                          decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color: Colors.lightBlue),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(records['lec1'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
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
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.38,
                                  height: 30,
                                ),
                                Container(
                                  height: 30,
                                  width: MediaQuery.sizeOf(context).width*0.01,
                                  color: Colors.blueAccent,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.6,
                                  height: 30,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      );
                    }
                    else{}
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}