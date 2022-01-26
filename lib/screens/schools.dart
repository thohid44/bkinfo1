import 'package:bkinform/controller/school_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class School extends StatelessWidget {
  //final GetxController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SchoolController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("School"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.eng.length,
          itemBuilder: (context, index) => Card(
            color: Color(0xff081029),
            child: ListTile(
              title: Text(controller.eng[index].name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(controller.eng[index].des!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    ));
  }
}
