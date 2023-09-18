import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<EventPage> {
  final CollectionReference _event =
      FirebaseFirestore.instance.collection("events");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar & Events',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 40,
                color: Colors.blueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Date',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width*0.75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Event List',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: StreamBuilder(
                  stream: _event.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }

                    if (snapshots.hasData) {
                      return ListView.builder(
                          itemCount: snapshots.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot records =
                                snapshots.data!.docs[index];
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.sizeOf(context).width * 0.25,
                                        height: 110,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 5, right: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.sizeOf(context).width*0.23,
                                                height: 78,
                                                // color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        records['Date'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                                fontSize: 30,
                                                                color: Colors.black54,
                                                                ),
                                                      ),
                                                      Text(records['month'],
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18,

                                                      ),),
                                                  ],
                                                ),
                                                
                                                      
                                                
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width *0.01,
                                        height: 110,
                                        color: Colors.blueAccent,
                                      ),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width *0.74,
                                        height: 80,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 5, left: 3),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.sizeOf(context).width *0.69,
                                                height: 37,
                                                decoration: BoxDecoration(
                                                    borderRadius:BorderRadius.circular(10),
                                                    color: Colors.blueGrey),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(records['event1'],style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                      ),
                                                  ],
                                                ),
                                                  
                                                
                                              ),
                                              SizedBox(
                                                height: 4,
                                              ),
                                              Container(
                                                width: MediaQuery.sizeOf(context).width * 0.69,
                                                height: 37,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.green),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(records['event2'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                      ),
                                                  ],
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
                            );
                          });
                    } else {}
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
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
