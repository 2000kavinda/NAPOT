import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class Stored{

  Future<String> saved ({
    required String roomNo,
    required String count,
    required String name,
    required String id,
    required String scount,
    required String purpose,
    required String from,
    required String to,

  }) async {
    String resp = "Some error occurred";
    try{
      await _firebaseStore.collection('libraryBookings').add({
        'roomNo' : roomNo,
        'count' : count,
        'name' : name,
        'id' : id,
        'scount' : scount,
        'purpose' : purpose,
        'from' : from,
        'to' : to,


      });
      resp = 'success';
    }
    catch(err){
      resp =err.toString();
    }
    return resp;
  }
}


