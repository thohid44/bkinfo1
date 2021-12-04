import 'package:bkinform/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  userRegistration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
      var authCredential = userCredential.user;
      //print(authCredential!.uid);
      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        Fluttertoast.showToast(
            msg: "This is Center Short Toast",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: TextFormField(
                  controller: _email,
                  style: const TextStyle(fontSize: 23, color: Colors.red),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your valid email",
                    hintStyle:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  style: const TextStyle(fontSize: 23, color: Colors.red),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                color: Colors.amber,
                child: TextButton.icon(
                    onPressed: () {
                      userRegistration();
                    },
                    icon: const Icon(Icons.app_registration_outlined),
                    label: const Text(
                      "Registration",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ))),
            GestureDetector(
              child: const Text("Have you no account? yet",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  )),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            )
          ],
        ),
      ),
    );
  }
}
