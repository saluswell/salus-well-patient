import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:saluswellpatient/common/utils/firebaseUtils.dart';
import 'package:saluswellpatient/src/authenticationsection/Models/userModel.dart';
import 'package:saluswellpatient/src/authenticationsection/Models/userModelDietitian.dart';





class FarmerServices {
  ///Get Specific User Details
  Stream<UserModel> getUserDetails(String docID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(docID)
        .snapshots()
        .map((event) =>
        UserModel.fromJson(event.data() as Map<String, dynamic>));
  }
}
