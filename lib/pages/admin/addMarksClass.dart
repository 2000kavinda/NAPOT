import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class Storing{

  Future<String> saving ({
    required String id,
    required String ys,
    required String module,
    required String grade,


  }) async {
    String resp = "Some error occurred";
    try{
      await _firebaseStore.collection('buses').add({
        'id' : id,
        'ys' : ys,
        'module' : module,
        'grade' : grade,


      });
      resp = 'success';
    }
    catch(err){
      resp =err.toString();
    }
    return resp;
  }
}


