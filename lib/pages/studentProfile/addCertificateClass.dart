import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class Store{

  Future<String> uploadImageToStorage(String childName,Uint8List file) async{
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveing ({
    required String id,
    required String description,
    required String certificatename,
    required Uint8List file}) async {
    String resp = "Some error occurred";
    try{
      String imageUrl = await uploadImageToStorage('certificateImage',file);
      await _firebaseStore.collection('certificates').add({
        'id' : id,
        'description' : description,
        'certificatename' : certificatename,

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


