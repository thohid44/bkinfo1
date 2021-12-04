import 'package:bkinform/screens/library.dart';
import 'package:bkinform/screens/schools.dart';
import 'package:bkinform/screens/teachers.dart';
import 'package:bkinform/widgets/customitem.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bk-Info"),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 170,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Library()));
                },
                child: CustomItem(
                  title: "Library",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => School()));
                },
                child: CustomItem(
                  title: "School",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Teachers()));
                },
                child: CustomItem(
                  title: "Teachers",
                ),
              ),
              CustomItem(
                title: "Hospital",
              ),
              CustomItem(
                title: "Fire Service",
              ),
              CustomItem(title: "Location")
            ],
          ),
        ),
      ),
    );
  }
}
