import 'package:flutter/material.dart';
import 'package:get/get.dart';

class todopage extends StatelessWidget {
  const todopage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(Container(
            height: Get.height * 0.5,
            width: Get.width,
            color: Colors.white,
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
