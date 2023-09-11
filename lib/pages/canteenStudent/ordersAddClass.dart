import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class StoreData{


  Future<String> saveData ({
    required String id,
    required String itemName,
    required String description,
    required String price,
    required String quantity,
    }) async {
      String resp = "Some error occurred";
      try{
        await _firebaseStore.collection('orders').add({
          'id': id,
          'itemName' : itemName,
          'description' : description,
          'price' : price,
          'quantity' : quantity,


        });
        resp = 'success';
      }
          catch(err){
            resp =err.toString();
          }
          return resp;
  }
}


