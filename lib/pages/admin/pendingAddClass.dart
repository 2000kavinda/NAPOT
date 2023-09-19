import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class StoreData{


  Future<String> saveData ({
    required String name,
    required String email,
    required String password,
    required String degree,
    required String index,
    required String batch,
    required String nic,
    }) async {
      String resp = "Some error occurred";
      try{
        await _firebaseStore.collection('users').add({
          'name': name,
          'email' : email,
          'password' : password,
          'degree' : degree,
          'index' : index,
          'batch' : batch,
          'nic' : nic,


        });
        resp = 'success';
      }
          catch(err){
            resp =err.toString();
          }
          return resp;
  }
}


