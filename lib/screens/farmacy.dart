import 'package:bkinform/controller/farmacy_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Farmacy extends StatelessWidget {
  //final GetxController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var farmacy = Get.put(FarmacyC());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Farmacy"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: farmacy.farm.length,
          itemBuilder: (context, index) => Card(
            color: Colors.green,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Name: ${farmacy.farm[index].name!}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white)),
                    Text("Expert: ${farmacy.farm[index].mobile!}",
                        style:
                            const TextStyle(fontSize: 22, color: Colors.white)),
                    Text("Contact: ${farmacy.farm[index].address!}",
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
