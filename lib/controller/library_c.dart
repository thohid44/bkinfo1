import 'package:bkinform/model/library_m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LibraryC extends GetxController {
// Firebase oparation

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<LibraryM> libraryM = RxList<LibraryM>([]);

  void onInit() {
    super.onInit();
    //  collectionReference = firebaseFirestore.collection('library');

    collectionReference = firebaseFirestore.collection('library');

    libraryM.bindStream(getAllEnglish());
  }

  Stream<List<LibraryM>> getAllEnglish() => collectionReference.snapshots().map(
      (query) => query.docs.map((item) => LibraryM.fromMap(item)).toList());
}
