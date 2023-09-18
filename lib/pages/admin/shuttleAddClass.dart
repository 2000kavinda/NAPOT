import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

class StoreData{

  Future<String> saveData ({
    required String busNo,
    required String destination,
    required String driver,
    required String stop1,
    required String stop2,
    required String stop3,
    required String stop4,
    required String stop5,
    required String stop6,
    required String stop7,
    required String time1,
    required String time2,
    required String time3,
    required String time4,
    required String time5,
    required String time6,
    required String time7,
    required String vehicleNo,

  }) async {
      String resp = "Some error occurred";
      try{
        await _firebaseStore.collection('buses').add({
          'busNo' : busNo,
          'destination' : destination,
          'driver' : driver,
          'stop1' : stop1,
          'stop2' : stop2,
          'stop3' : stop3,
          'stop4' : stop4,
          'stop5' : stop5,
          'stop6' : stop6,
          'stop7' : stop7,
          'time1' : stop1,
          'time2' : time2,
          'time3' : time3,
          'time4' : time4,
          'time5' : time5,
          'time6' : time6,
          'time7' : time7,
          'vehicleNo' : vehicleNo,

        });
        resp = 'success';
      }
          catch(err){
            resp =err.toString();
          }
          return resp;
  }
}


