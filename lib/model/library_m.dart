import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryM {
  String? docId;
  String? name;
  String? mobile;
  String? location;

  LibraryM({this.docId, this.name, this.mobile, this.location});

  LibraryM.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];

    location = data["location"];
    mobile = data["mobile"];
  }
}
