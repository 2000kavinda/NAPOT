import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled1/pages/admin/addUser.dart';

class AuthMethods{
  final FirebaseAuth auth= FirebaseAuth.instance;
  final FirebaseFirestore firestore= FirebaseFirestore.instance;

  Future<String> registerUser({
    required String email,
    required String password,
    required String name,
    required String degree,
    required String index,
    required String batch,
    required String nic,
  }) async{
    String resp ="Some Error occured";
    try{
      if(email.isNotEmpty|| password.isNotEmpty||name.isNotEmpty||degree.isNotEmpty||index.isNotEmpty||batch.isNotEmpty||nic.isNotEmpty){
        UserCredential credential =await auth.createUserWithEmailAndPassword(email: email, password: password);

        UserData userData= UserData(
          email: email,
          uid: credential.user!.uid,
          name: name,
          degree: degree,
          index: index,
          batch: batch,
          nic: nic,
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