// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDetails extends StatelessWidget {
  final details;

  CustomDetails({required this.details});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                  details['img'],
                )),
                borderRadius: BorderRadius.circular(19))),
        SizedBox(
          height: 10,
        ),
        Text("প্রতিষ্ঠানের নামঃ ${details['name']}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Text("ঠিকানা:",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
        SizedBox(
          height: 10,
        ),
        Text("মোবাইল ঃ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
        SizedBox(
          height: 15,
        )
      ]),
    );
  }
}
