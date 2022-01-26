import 'package:bkinform/english_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
// Firebase oparation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  RxList<EnglishModel> eng = RxList<EnglishModel>([]);

  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection('library');
    eng.bindStream(getAllEnglish());
  }

  Stream<List<EnglishModel>> getAllEnglish() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => EnglishModel.fromMap(item)).toList());
}
