import 'package:cloud_firestore/cloud_firestore.dart';

class FarmacyM {
  String? docId;
  String? name;

  String? address;
  String? mobile;

  FarmacyM({this.docId, this.name, this.address, this.mobile});

  FarmacyM.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];

    address = data["address"];
    mobile = data["mobile"];
  }
}
