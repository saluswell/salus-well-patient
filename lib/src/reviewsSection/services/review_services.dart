import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:saluswellpatient/src/apppointmentsSection/models/appointmentModel.dart';

import '../../../common/helperFunctions/getUserIDhelper.dart';
import '../../../common/utils/firebaseUtils.dart';
import '../models/review_model.dart';

class ReviewServices {
  ///Create Review
  Future createReview(ReviewModel reviewModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection(FirebaseUtils.reviews).doc();
    return await docRef.set(reviewModel.toJson(docRef.id));
  }

  /// Stream dieitian reviews
  Stream<List<ReviewModel>> streamReviewsList() {
    //  try {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.reviews)
        .where("reviewRecieverID", isEqualTo: getUserID())
        //.where("isApprovedByAdmin", isEqualTo: isApprove)
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => ReviewModel.fromJson(singleDoc.data()))
            .toList());
  }

  /// update timeslots updated
  Future UpdateReviewStatusOfDietitan(
      AppointmentModel appointmentModelNew, String appointmentID) async {
    return await FirebaseFirestore.instance
        .collection(FirebaseUtils.appointments)
        .doc(appointmentID)

        //.where("userID", isEqualTo: date)
        .update({
      "isReviewGivenByPatient": true,
    });
  }
}
