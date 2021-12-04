import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  final CollectionReference _ref = FirebaseFirestore.instance.collection("web");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("library").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }

              // return ListView(
              //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //     Map<String, dynamic> data =
              //         document.data()! as Map<String, dynamic>;
              //     return ListTile(
              //       title: Text(data['name']),
              //       subtitle: Text(data['des']),
              //     );
              //   }).toList(),
              // );

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LibDetails(document)));
                    },
                    title: Card(
                        child: Text(data['name'],
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold))),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }
}

class LibDetails extends StatelessWidget {
  final data;
  LibDetails(this.data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 23,
            ),
            Container(
              height: 160,
              child: Image.network(data['url']),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Column(
                children: [
                  Text(data['name']),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(data['des']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
