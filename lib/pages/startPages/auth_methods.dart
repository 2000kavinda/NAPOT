import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/pages/startPages/addUser.dart';

class AuthMethods{
  final FirebaseAuth auth= FirebaseAuth.instance;
  final FirebaseFirestore firestore= FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
  }) async{
    String resp ="Some Error occured";
    try{
      if(email.isNotEmpty|| password.isNotEmpty||name.isNotEmpty){
        UserCredential credential =await auth.createUserWithEmailAndPassword(email: email, password: password);

        UserData userData= UserData(
          email: email,
          uid: credential.user!.uid,
          name: name,
        );

        await firestore.collection('users').doc(credential.user!.uid).set(
          userData.toJson(),
        );
        resp="success";
      }
    }
    catch(err){
      resp=err.toString();
    }
    return resp;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String resp ="Some Error occured";
    try{
      if(email.isNotEmpty|| password.isNotEmpty){
        await auth.signInWithEmailAndPassword(
            email: email,
            password: password,

        );


        resp="success";
      }else{
        resp="please fill all";
      }
    }
    catch(err){
      resp=err.toString();
    }
    return resp;
  }

}