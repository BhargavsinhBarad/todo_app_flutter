import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/modules/utils/golbal.dart';
import 'package:todo_app_flutter/modules/views/login/model/helper/apihelper.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F0F0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: Get.height * 0.22,
                child: Image.asset(
                  "assets/eclipse.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Welcome Back !",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Image.asset("assets/Logo.png"),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: global.emalicon,
                onChanged: emailclick,
                decoration: InputDecoration(
                  hintText: "Enter email...",
                  label: Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: global.passcon,
                onChanged: passclick,
                decoration: InputDecoration(
                  hintText: "Enter password...",
                  label: Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            GestureDetector(
              onTap: loginclick,
              child: Container(
                margin: EdgeInsets.all(15),
                height: Get.height * 0.06,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.lightBlue.withOpacity(0.8),
                ),
                child: const Center(
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  loginclick() async {
    dynamic login = await apihelper.api
        .getdata(email: global.email, password: global.password);
    log("${login}");
    if (login == true) {
    } else {
      Get.snackbar("TODO APP", "Login fail");
    }
  }

  emailclick(val) {
    global.email = val;
  }

  passclick(val) {
    global.password = val;
  }
}
