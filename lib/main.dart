import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app_flutter/firebase_options.dart';
import 'package:todo_app_flutter/modules/views/login/views/loginpage.dart';
import 'package:todo_app_flutter/modules/views/todoscreen/views/todoscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: todopage(),
    ),
  );
}
