import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_admin/login/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  static const pageName = "/login";
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormController ctrler = Get.put(FormController());
  @override

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (String value) => ctrler.email = value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.assignment_ind_outlined),
                      hintText: "E-mail",
                      errorText: ctrler.errorText
                    ),
                  ),
                  TextFormField(
                    onChanged: (String value) => ctrler.email = value,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Password",
                      errorText: ctrler.errorText,
                    ),
                  ),
                ]
              ),
            )
          ]
        )
      )
    );
  }
}
