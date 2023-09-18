import 'package:flutter/material.dart';
import 'package:untitled1/pages/canteenStudent/dialogbox.dart';
import 'package:untitled1/pages/startPages/addUser.dart';
import 'package:untitled1/pages/startPages/auth_methods.dart';
import 'package:untitled1/pages/startPages/signIn.dart';
import 'package:untitled1/pages/startPages/signup.dart';
import 'package:untitled1/pages/startPages/userAddClass.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final CollectionReference reference =
      FirebaseFirestore.instance.collection('cardDetails');

  // Fixed key parameter syntax
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final degreeController = TextEditingController();

  final passwordController = TextEditingController();
  final cardNoController = TextEditingController();
  final expController = TextEditingController();
  final cvvController = TextEditingController();

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  void registerUser() async {
    String resp = await AuthMethods().registerUser(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  Future<int> getAvailableBalance(
      String cardNum, String exp, String cvv) async {
    try {
      final cardDataQuery = await FirebaseFirestore.instance
          .collection('cardDetails')
          .where('cardNum', isEqualTo: cardNum)
          .where('exp', isEqualTo: exp)
          .where('cvv', isEqualTo: cvv)
          .limit(1)
          .get();

      if (cardDataQuery.docs.isNotEmpty) {
        final cardData =
            cardDataQuery.docs.first.data() as Map<String, dynamic>;
        final balance = cardData['balance'] ?? 0;
        return balance;
      } else {
        // Card not found in the database
        return -1; // Or any other error code or value you prefer
      }
    } catch (e) {
      // Handle database errors
      print('Error fetching available balance: $e');
      return -1; // Or any other error code or value you prefer
    }
  }

  void updateBalance(String cardNum, int balance) {
    reference.doc(cardNum).update({
      "balance": balance,
    }).then((_) {
      //Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }

  void post() async {
    String name = nameController.text;
    String email = emailController.text;
    String degree = degreeController.text;

    String resp =
        await StoreData().saveData(name: name, email: email, degree: degree);
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Start NSBM Banner
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 370,
                child: Image.asset(
                  'assets/images/loginImg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              //End of NSBM Banner

              //Start Sign up Text
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //End of Sign up Text
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    //Start name
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Name with intials',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //End name
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: nameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Start email
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //End email
                    SizedBox(
                      height: 20,
                    ),

                    //Start degree
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Degree Programme',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: TextField(
                                readOnly: false,
                                controller: degreeController,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.black12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //End degree
                    SizedBox(
                      height: 20,
                    ),
                    //Start Certification
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Certifications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 5,
                          ),
                          child: Text(
                            'Please send document as one pdf \n(A/L,O/L,ID,Birth Certifications)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //End Certification
                    SizedBox(
                      height: 10,
                    ),
                    //Start Send button
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              onPressed: () async {
                                String? encodeQueryParameters(
                                    Map<String, String> params) {
                                  return params.entries
                                      .map((MapEntry<String, String> e) =>
                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                      .join('&');
                                }

                                // ···
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'admin@gmail.com',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject':
                                        'Example Subject & Symbols are allowed!',
                                  }),
                                );

                                if (await canLaunchUrl(emailLaunchUri)) {
                                  launchUrl(emailLaunchUri);
                                } else {
                                  throw Exception(
                                      'could not launch $emailLaunchUri');
                                }
                              },
                              child: Text(
                                'Send file',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.green,
                              textColor: Colors.white,
                              minWidth: 100,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //End Send button
                    SizedBox(
                      height: 40,
                    ),

                    //Start Pay & Register button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: MaterialButton(
                            onPressed: () {
                              if (nameController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty &&
                                  degreeController.text.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) => FullScreenDialog(
                                    content: Container(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: <Widget>[
                                          //start credit car banner
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Image.asset(
                                              'assets/images/payImg2.png',
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          //End credit card banner
                                          SizedBox(
                                            height: 10,
                                          ),
                                          //Start card number
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  'Card Number',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      controller:
                                                          cardNoController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Colors.black12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //End card number

                                          SizedBox(
                                            height: 20,
                                          ),
                                          //Start expire date
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  'Expiry Date',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      controller: expController,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        hintText: 'MM/YY',
                                                        filled: true,
                                                        fillColor:
                                                            Colors.black12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //End expire date
                                          SizedBox(
                                            height: 20,
                                          ),
                                          //Start CVV
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  'CVV',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    child: TextField(
                                                      controller: cvvController,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      decoration:
                                                          const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Colors.black12,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          //End CVV
                                          SizedBox(
                                            height: 20,
                                          ),
                                          //Start Text
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(9.0),
                                              child: Text(
                                                "You can pay registration fee here. registration fee is Rs.10000. You can also download the slip after the payment.",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  //fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          //End Text

                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: MaterialButton(
                                                  onPressed: () async {
                                                    // Get the card number entered by the user
                                                    final cardNum =
                                                        cardNoController.text;
                                                    final exp =
                                                        expController.text;
                                                    final cvv =
                                                        cvvController.text;

                                                    // Get available balance
                                                    var balance =
                                                        await getAvailableBalance(
                                                            cardNum, exp, cvv);

                                                    if (balance >= 10000) {
                                                      // Sufficient balance, proceed with the payment

                                                      post();
                                                      balance = balance - 10000;
                                                      updateBalance(
                                                          cardNum, balance);
                                                      print(
                                                          'Payment successful');

                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            FullScreenDialog(
                                                          content: Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Image.asset(
                                                                      'assets/ok.png'),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      "REGISTERED SUCCESSFULLY !",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      "After check your details we will send login details via email. Please check your registered email for email verification.",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black54,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    } else {
                                                      // Insufficient balance
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            Dialog(
                                                          child: Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: ListView(
                                                                shrinkWrap:
                                                                    true,
                                                                children: <Widget>[
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/crossMark.png',
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      "Something went wrong",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .black87,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Text('Pay now'),
                                                  color: Colors.green,
                                                  textColor: Colors.white,
                                                  minWidth: 100,
                                                  height: 40,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Image.asset(
                                                'assets/images/cross.svg'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Please fill all fields",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Pay & Register',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            color: Colors.green,
                            textColor: Colors.white,
                            minWidth: 150,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                    //End Pay & Register button

                    //Start Signin button
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            "Already have an account ?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateToSignUp(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              " Signin",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //End Signin button
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
