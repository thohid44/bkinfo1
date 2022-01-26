import 'package:bkinform/controller/doctor_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorView extends StatelessWidget {
  //final GetxController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var con = Get.put(DoctorController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Doctor List"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: con.doct.length,
          itemBuilder: (context, index) => Card(
            color: Colors.green,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Name: ${con.doct[index].name!}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white)),
                    Text("Expert: ${con.doct[index].specialist!}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white)),
                    Text("Contact: ${con.doct[index].contact!}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
