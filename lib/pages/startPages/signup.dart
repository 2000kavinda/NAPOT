
import 'package:flutter/material.dart';
import 'package:untitled1/pages/startPages/addUser.dart';
import 'package:untitled1/pages/startPages/auth_methods.dart';
import 'package:untitled1/pages/startPages/signIn.dart';
import 'package:untitled1/pages/startPages/signup.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 // Fixed key parameter syntax
  final FirebaseAuth auth= FirebaseAuth.instance;

  final FirebaseFirestore firestore= FirebaseFirestore.instance;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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
                    "Password",
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
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
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
                  onPressed: registerUser,
                  child: Text('Register'),
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
