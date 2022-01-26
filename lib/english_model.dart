import 'package:cloud_firestore/cloud_firestore.dart';

class EnglishModel {
  String? docId;
  String? name;

  String? des;
  EnglishModel({this.docId, this.name, this.des});

  EnglishModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];

    des = data['des'];
  }
}
