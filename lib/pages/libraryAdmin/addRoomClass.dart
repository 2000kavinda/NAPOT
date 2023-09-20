import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class Store{

  Future<String> save ({
    required String roomNo,
    required String count,

  }) async {
    String resp = "Some error occurred";
    try{
      await _firebaseStore.collection('libraryRooms').add({
        'roomNo' : roomNo,
        'count' : count,


      });
      resp = 'success';
    }
    catch(err){
      resp =err.toString();
    }
    return resp;
  }
}


