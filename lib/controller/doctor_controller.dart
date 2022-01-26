import 'package:bkinform/model/doctor_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
// Firebase oparation

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<DoctorModel> doct = RxList<DoctorModel>([]);

  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('doctor');
    doct.bindStream(getAllDoctor());
  }

  Stream<List<DoctorModel>> getAllDoctor() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => DoctorModel.fromMap(item)).toList());

  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  // late CollectionReference collectionReference;
  // RxList<EnglishModel> eng = RxList<EnglishModel>([]);

  // Stream<List<EnglishModel>> getAllEnglish() =>
  //     collectionReference.snapshots().map((query) =>
  //         query.docs.map((item) => EnglishModel.fromMap(item)).toList());
}
