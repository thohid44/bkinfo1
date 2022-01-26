import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormFieldState> _formkey = GlobalKey();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();

  // sundUserInfo() async {
  //   CollectionReference _collectref =
  //       FirebaseFirestore.instance.collection('user-info');
  //   return _collectref.doc().set({'name': _name}).then((value) {
  //     Fluttertoast.showToast(msg: "inserted");
  //   }).catchError((onError) {
  //     Fluttertoast.showToast(msg: 'error');
  //   });
  // }

  userInformation() async {
    CollectionReference _ref =
        FirebaseFirestore.instance.collection('user-data');

    return _ref.doc().set({
      "name": _name,
      "phone": _phone,
      "address": _address,
    }).then((value) {
      Fluttertoast.showToast(msg: "Data has been successfully Stored");
    }).catchError((onError) {
      Fluttertoast.showToast(msg: "Something Wrong");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile Data")),
      body: Column(
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      hintText: "Enter you name", border: OutlineInputBorder()),
                ),
                TextField(
                  controller: _phone,
                  decoration: const InputDecoration(
                      hintText: "Enter you PHone",
                      border: OutlineInputBorder()),
                ),
                TextField(
                  controller: _address,
                  decoration: const InputDecoration(
                      hintText: "Enter you Address",
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              userInformation();
            },
            child: const Text(
              "User Data",
              style: TextStyle(fontSize: 19, color: Colors.black),
            ),
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10), primary: Colors.deepOrange),
          )
        ],
      ),
    );
  }
}
