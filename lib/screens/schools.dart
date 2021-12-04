import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  String title = "School ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("school").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: Colors.red));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name']),
                leading: const Icon(Icons.book, color: Colors.red, size: 50),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SchoolDetails(document)));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class SchoolDetails extends StatelessWidget {
  final data;
  SchoolDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("School Details")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(data['img']),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(data['name']),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

//  1. Create a project in Firebase 
//  2. Intregrate or connect firebase with our Flutter Project 