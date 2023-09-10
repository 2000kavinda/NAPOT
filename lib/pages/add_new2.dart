import 'package:flutter/material.dart';

class vvex extends StatefulWidget {
  const vvex({super.key});

  @override
  State<vvex> createState() => _vvexState();
}

class _vvexState extends State<vvex> {
  final Lectures = [
    'Lecture 01',
    'Lecture 02',
    'Lecture 03',
    'Lecture 04',
    'Lecture 05',
    'Lecture 06',
    'Lecture 07',
    'Lecture 08',
    'Lecture 09',
    'Lecture 10',
    'Lecture 11',
    'Lecture 12',
    'Lecture 13',
    'Lecture 14',
    'Lecture 15'
  ];
  String Lecture = 'Lecture 01';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('practice'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lecture Number',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: Lecture,
                    items: Lectures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        Lecture = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lecture Topic",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Attach Lecture Materials',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 18, 187, 24),
                        minimumSize: Size(89, 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                        )),
                    onPressed: () {},
                    child: Text('Browse'),
                  ),
                  SizedBox(height: 10),
                  Text('You can attach document by clicking on the add button'),
                  SizedBox(height: 20),

                  Text(
                    "Links",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'inter',
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)),
                    ),
                  ),
                  
                  SizedBox(height: 15),

                  builbutton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget builbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(89, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              )),
          onPressed: () {},
          child: Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(89, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.0),
              )),
          onPressed: () {},
          child: Text('Post'),
        ),
      ],
    );
  }
}
