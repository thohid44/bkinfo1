import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  String? docId;
  String? name;
  String? degination;
  String? des;

  TeacherModel({this.docId, this.name, this.des});

  TeacherModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    degination = data["degintation"];
    des = data["des"];
  }
}
