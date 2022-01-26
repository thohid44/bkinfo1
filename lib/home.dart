import 'dart:async';

import 'package:bkinform/screens/landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 8), () {
      Get.to(LandingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.deepOrange,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: 250,
                  child: const Image(image: AssetImage('assets/bridge.jpg')),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Informative Boalkhali",
                    style: TextStyle(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(
                  height: 20,
                ),
                const CircularProgressIndicator(color: Colors.white)
              ],
            ),
          )),
    );
  }
}
