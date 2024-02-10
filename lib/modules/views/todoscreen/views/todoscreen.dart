import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/modules/utils/golbal.dart';
import 'package:todo_app_flutter/modules/views/todoscreen/helper/firestore%20helper.dart';

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
            height: Get.height * 0.8,
            width: Get.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (val) {
                        global.title = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter title",
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (val) {
                        global.id = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Task", border: OutlineInputBorder()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (val) {
                        global.task = val;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Id", border: OutlineInputBorder()),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          global.timepick = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                        },
                        icon: Icon(Icons.watch),
                      ),
                      Text("Pick time"),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Firestorehelper.firestorehelper.addtask(data: {
                          "task": "${global.email}",
                          "id": "${global.id}",
                          "title": "${global.title}",
                          "time":
                              "${global.timepick!.hour}:${global.timepick!.minute}",
                        });
                      },
                      child: Text("ADD"))
                ],
              ),
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
