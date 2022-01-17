import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
      GetMaterialApp(
          initialRoute: TaskAdmin.pageName,
          getPages: [
            GetPage(name: LoginView.pageName, page: () => LoginView()),
          ],
          home: TaskAdmin()));
}

class TaskAdmin extends StatelessWidget {
  TaskAdmin({Key? key}) : super(key: key);

  static const pageName = "/";
  final RxBool _continueTo = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task admin v0.1a'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (() => Get.toNamed(LoginView.pageName)),
                child: const Text("Sign in")),
            // ElevatedButton(
            //     onPressed: (() => Get.toNamed(RegisterView.pageName)),
            //     child: const Text("Sign up"))
          ],
        ),
      ),
    );
  }
}
