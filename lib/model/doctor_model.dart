import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  String? docId;
  String? name;
  String? specialist;
  String? location;
  String? contact;

  DoctorModel(
      {this.docId, this.name, this.specialist, this.location, this.contact});

  DoctorModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    specialist = data["specialist"];
    location = data["location"];
    contact = data["contact"];
  }
}
