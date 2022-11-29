import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saluswellpatient/common/utils/firebaseUtils.dart';
import 'package:saluswellpatient/common/utils/textutils.dart';
import 'package:saluswellpatient/src/authenticationsection/Models/userModel.dart';
import 'package:saluswellpatient/src/authenticationsection/Models/userModelDietitian.dart';

class HomeServices {
  Stream<List<UserModelDietitian>> streamAllDietitans() {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .where("UserType", isEqualTo: TextUtils.Dietitian)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => UserModelDietitian.fromJson(singleDoc.data()))
            .toList());
  }
}
