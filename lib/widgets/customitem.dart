import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomItem extends StatelessWidget {
  final title;

  CustomItem({Key? key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Colors.blue, style: BorderStyle.solid)),
      child: Card(
          child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.lato(fontSize: 17),
            textAlign: TextAlign.end,
          ),
        ],
      )),
    );
  }
}

class CustomDesign extends StatelessWidget {
  const CustomDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
