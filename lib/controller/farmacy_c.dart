import 'package:bkinform/model/farmacy_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FarmacyC extends GetxController {
// Firebase oparation

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<FarmacyM> farm = RxList<FarmacyM>([]);

  void onInit() {
    super.onInit();
    //  collectionReference = firebaseFirestore.collection('library');

    collectionReference = firebaseFirestore.collection('farmacy');

    farm.bindStream(getAllFarmacy());
  }

  Stream<List<FarmacyM>> getAllFarmacy() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => FarmacyM.fromMap(item)).toList());
}
