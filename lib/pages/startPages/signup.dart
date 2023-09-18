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
  final CollectionReference reference = FirebaseFirestore.instance.collection('cardDetails');


  // Fixed key parameter syntax
  final FirebaseAuth auth= FirebaseAuth.instance;

  final FirebaseFirestore firestore= FirebaseFirestore.instance;

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

  void registerUser() async{
    String resp=await AuthMethods().registerUser(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
    );


  }

  Future<int> getAvailableBalance(String cardNum,String exp,String cvv) async {
    try {
      final cardDataQuery = await FirebaseFirestore.instance
          .collection('cardDetails')
          .where('cardNum', isEqualTo: cardNum)
          .where('exp', isEqualTo: exp)
          .where('cvv', isEqualTo: cvv)
          .limit(1)
          .get();

      if (cardDataQuery.docs.isNotEmpty) {
        final cardData = cardDataQuery.docs.first.data() as Map<String, dynamic>;
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

  void updateBalance(String cardNum,int balance) {
    reference.doc(cardNum).update({
      "balance": balance,

    }).then((_) {
      Navigator.of(context).pop(); // Close the dialog
    }).catchError((error) {
      print("Error updating document: $error");
    });
  }

  void post() async {
    String name = nameController.text;
    String email = emailController.text;
    String degree = degreeController.text;


    String resp = await StoreData()
        .saveData(name: name, email: email, degree: degree);
  }

  void dispose(){
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/logs.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name with initials",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  readOnly: false,
                  controller: nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                TextField(
                  readOnly: false,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Degree programme",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  readOnly: false,
                  controller: degreeController,
                  keyboardType: TextInputType.text,
                  //obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Certificates",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Please send document as one pdf (A/L,O/L,ID,Birth Certifications)",
                    style: TextStyle(
                      fontSize: 14,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MaterialButton(
                    onPressed: ()async {
                      String? encodeQueryParameters(Map<String, String> params) {
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
                          'subject': 'Example Subject & Symbols are allowed!',
                        }),
                      );

                      if(await canLaunchUrl(emailLaunchUri)){
                      launchUrl(emailLaunchUri);
                      } else {
                      throw Exception('could not launch $emailLaunchUri');
                      }
                    },
                    child: Text('Send file'),
                    color: Colors.green,
                    textColor: Colors.white,
                    minWidth: 100,
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MaterialButton(
                  onPressed: (){
                    if(nameController.text.isNotEmpty && emailController.text.isNotEmpty && degreeController.text.isNotEmpty){

                      showDialog(
                        context: context,
                        builder: (context) => FullScreenDialog(
                          content: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView(
                                shrinkWrap: true,
                                children: <Widget>[
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Image.asset('assets/card.png'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Card number",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: cardNoController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Expiry date",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: expController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: 'MM/YY',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "CVV",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: cvvController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "You can pay registration fee here. registration fee is Rs.10000. You can also download the slip after the payment.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 60,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      MaterialButton(
                                        onPressed: () async {
                                          // Get the card number entered by the user
                                          final cardNum = cardNoController.text;
                                          final exp = expController.text;
                                          final cvv = cvvController.text;

                                          // Get available balance
                                          var balance = await getAvailableBalance(cardNum,exp,cvv);

                                          if (balance >= 10000) {
                                            // Sufficient balance, proceed with the payment

                                            post();
                                            balance = balance - 10000;
                                            updateBalance(cardNum,balance);
                                            print('Payment successful');

                                            showDialog(
                                              context: context,
                                              builder: (context) => FullScreenDialog(
                                                content: Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: ListView(
                                                      shrinkWrap: true,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Image.asset('assets/ok.png'),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            "REGISTERED SUCCESSFULLY !",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            "After check your details we will send login details via email. Please check your registered email for email verification.",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.red,
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
                                                        Image.asset('assets/error.png'),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Text(
                                                            "Something went wrong",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.red,
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
                                        child: Text('Pay'),
                                        color: Colors.blue,
                                        textColor: Colors.white,
                                        minWidth: 100,
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }else{
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
                                  Image.asset('assets/error.png'),
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
                                        color: Colors.red,
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
                  child: Text('Pay & Register'),
                  color: Colors.green,
                  textColor: Colors.white,
                  minWidth: 150,
                  height: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Already have an account ?"),
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateToSignUp(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text("Signin",style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
