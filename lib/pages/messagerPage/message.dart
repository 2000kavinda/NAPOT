import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Start Search bar
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: TextField(
                      readOnly: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Seach Lectures',
                        filled: true,
                        fillColor: Colors.black12,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //End Search bar
            SizedBox(
              height: 20,
            ),
            //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Dr.Rasika Ranaweera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thankyou sir!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Just now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details

             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Mrs.Pavithra Subhasinghe',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'I will inform you',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Just now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Dr.Safraz',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Yes sir',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Just now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Mr.Pramudya Thilakarathne',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'I will check that.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('Just now',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Mr.Namal Balasooriya',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Fill the document',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              // Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('seen',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Dr.Rasika Ranaweera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thankyou sir!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              // Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('seen',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: () {
                
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Dr.Rasika Ranaweera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thankyou sir!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              // Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('seen',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
             //Start Message details
            InkWell(
              onTap: (){},              
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.black12,
                  child: Row(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_image.png', // Replace with the actual path to your image
                                    width:
                                        60, // Adjust the width of the circular image as needed
                                    height:
                                        60, // Adjust the height of the circular image as needed
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      'Dr.Rasika Ranaweera',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Thankyou sir!',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.2,
                          child: Column(
                            children: [
                              // Image.asset('assets/images/1msg.png'),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text('seen',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  
                ),
              ),
            ),
            //End Message details
          ],
        ),
      ),
    );
  }
}
