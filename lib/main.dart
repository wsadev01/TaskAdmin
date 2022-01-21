import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'register/register_view.dart';
import 'login/login_view.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  return runApp(
      GetMaterialApp(
          initialRoute: TaskAdmin.pageName,
          getPages: [
            GetPage(name: LoginView.pageName, page: () => LoginView()),
            GetPage(name: RegisterView.pageName, page: () => RegisterView()),
          ],
          home: TaskAdmin()));
}

class TaskAdmin extends StatelessWidget {
  TaskAdmin({Key? key}) : super(key: key);

  static const pageName = "/";

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
            ElevatedButton(
                onPressed: (() => Get.toNamed(RegisterView.pageName)),
                child: const Text("Sign up"))
          ],
        ),
      ),
    );
  }
}
