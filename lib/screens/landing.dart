import 'package:bkinform/homeview.dart';
import 'package:bkinform/screens/clinic.dart';
import 'package:bkinform/screens/doctor.dart';
import 'package:bkinform/screens/farmacy.dart';
import 'package:bkinform/screens/madrasah.dart';
import 'package:bkinform/screens/schools.dart';
import 'package:bkinform/screens/teachers.dart';
import 'package:bkinform/widgets/customitem.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> slider = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple[200],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("ইনফরমেটিভ বোয়ালখালী",
                    style: GoogleFonts.lato(fontSize: 35, color: Colors.white)),
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5),
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(DoctorView());
                      },
                      child: CustomItem(
                        title: "ডাক্তার",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Farmacy());
                      },
                      child: CustomItem(
                        title: "ফার্মেসী",
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(Clinic());
                        },
                        child: CustomItem(title: "হাসপাতাল \n ক্লিনিক")),
                    GestureDetector(
                      onTap: () {
                        Get.to(Teachers());
                      },
                      child: CustomItem(
                        title: "শিক্ষকবৃন্দ",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeView()));
                      },
                      child: CustomItem(
                        title: "লাইব্রেরী",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(Madrasah()),
                      child: CustomItem(
                        title: "মাদ্রাসা \n এতিমখানা",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(School()),
                      child: CustomItem(
                        title: "বিদ্যালয়",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
