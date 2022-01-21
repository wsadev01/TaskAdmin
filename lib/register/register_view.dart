import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_admin/register/register_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/auth_controller.dart';

class RegisterView extends GetWidget<AuthController> {
  RegisterView({Key? key}) : super(key: key);
  static const pageName = "/register";
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FormController ctrler = Get.put(FormController());
  final AuthController authCtrler = AuthController();
  @override

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextFormField(
              onChanged: (String value) => ctrler.email = value,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.assignment_ind_outlined),
                hintText: "E-mail",
                errorText: ctrler.emailErrorText),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (String value) => ctrler.password = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Password",
                      errorText: ctrler.passwordErrorText)),
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: (String value) => ctrler.confirmPassword = value,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.lock_outline),
                      hintText: "Confirm Password",
                      errorText: null)),
                ),
              ]
            ),
            ElevatedButton(
              onPressed: () {
                print(ctrler.password);
                print(ctrler.email);
                  authCtrler.signUp(ctrler.email, ctrler.password);
                },
                child: const Text("Sign up"))
          ]
        ),
      )
    );
  }
}
