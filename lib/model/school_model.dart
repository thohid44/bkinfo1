import 'package:cloud_firestore/cloud_firestore.dart';

class SchoolModel {
  String? docId;
  String? name;
  String? des;

  SchoolModel({this.docId, this.name, this.des});

  SchoolModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    des = data["des"];
  }
}
