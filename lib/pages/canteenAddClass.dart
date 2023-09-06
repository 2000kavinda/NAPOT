import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class StoreData{

  Future<String> uploadImageToStorage(String childName,Uint8List file) async{
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
  }

  Future<String> saveData ({
    required String itemName,
    required String description,
    required String price,
    required String category,
    required Uint8List file}) async {
      String resp = "Some error occurred";
      try{
        String imageUrl = await uploadImageToStorage('canteenItemImage',file);
        await _firebaseStore.collection('canteenItems').add({
          'itemName' : itemName,
          'description' : description,
          'price' : price,
          'category' : category,
          'imageLink' : imageUrl,

        });
        resp = 'success';
      }
          catch(err){
            resp =err.toString();
          }
          return resp;
  }
}


