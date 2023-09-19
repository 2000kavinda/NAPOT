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
    required String degree,
  }) async {
      String resp = "Some error occurred";
      try{
        //String imageUrl = await uploadImageToStorage('canteenItemImage',file);
        await _firebaseStore.collection('pendingUsers').add({
          'name' : name,
          'email' : email,
          'degree' : degree,

        });
        resp = 'success';
      }
          catch(err){
            resp =err.toString();
          }
          return resp;
  }
}


