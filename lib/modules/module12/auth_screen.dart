import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_auth/my_auth.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  var authMap = <String, dynamic>{}.obs;
  var notification = "".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: ListView(
        children: [
          Login(
            input1: "phone",
            obscureText: true,
            onAuthenticated: (Map<String, dynamic> map) {
              authMap.value = map;
            },
            onRegisterButtonPressed: () {
              notification.value = 'onRegisterButtonPressed';
            },
            onPasswordForgotButtonPressed: () {
              notification.value = 'onPasswordForgotButtonPressed';
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Text(
                "Phone : ${authMap.value['phone']}",
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Text(
                "Password : ${authMap.value['password']}",
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Text(
                "NOTIFICATION : ${notification.value}",
              );
            }),
          ),
        ],
      ),
    );
  }
}
