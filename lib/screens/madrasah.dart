import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Madrasah extends StatefulWidget {
  const Madrasah({Key? key}) : super(key: key);

  @override
  _MadrasahState createState() => _MadrasahState();
}

class _MadrasahState extends State<Madrasah> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Madrasah"),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("madrasah").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Card(
                    color: Colors.deepPurple,
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Name: ${data['name']}",
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.white)),
                            Text("Contact: ${data['address']}",
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}
