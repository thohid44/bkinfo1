import 'package:bkinform/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  //final GetxController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.eng.length,
          itemBuilder: (context, index) => Card(
            color: const Color(0xff081029),
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
                leading: CircleAvatar(
                  child: Text(
                    controller.eng[index].des!.substring(0, 1).capitalize!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                onTap: () {
                  Get.to(Details(controller.eng[index]));
                }),
          ),
        ),
      ),
    ));
  }
}

class Details extends StatelessWidget {
  var data;
  Details(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data['name'].toString()),
      ),
    );
  }
}
