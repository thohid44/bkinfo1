import 'package:bkinform/english_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SchoolController extends GetxController {
// Firebase oparation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<EnglishModel> eng = RxList<EnglishModel>([]);

  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('school');
    eng.bindStream(getAllEnglish());
  }

  @override
  void onReady() {
    super.onReady();
  }

  Stream<List<EnglishModel>> getAllEnglish() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => EnglishModel.fromMap(item)).toList());
}
