import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class StoreQa{

  Future<String> saveQa ({
    required String q,
    required String a,


  }) async {
    String resp = "Some error occurred";
    try{
      await _firebaseStore.collection('qa').add({
        'q' : q,
        'a' : a,

      });
      resp = 'success';
    }
    catch(err){
      resp =err.toString();
    }
    return resp;
  }
}


