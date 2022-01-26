import 'package:bkinform/controller/library_c.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var con = Get.put(LibraryC());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Libray"),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: con.libraryM.length,
            itemBuilder: (context, index) => Card(
              color: Colors.green,
              child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Name: ${con.libraryM[index].name!}",
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white)),
                      Text("Expert: ${con.libraryM[index].location!}",
                          style: const TextStyle(
                              fontSize: 22, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 23,
              ),
              Container(
                height: 260,
                child: Image.network(data['url']),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Column(
                  children: [
                    Text(data['name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(data['des'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
