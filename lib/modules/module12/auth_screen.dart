import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_auth/my_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var authMap = <String, dynamic>{}.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Screen'),
      ),
      body: Column(
        children: [
          Login(
            onAuthenticated: (Map<String, dynamic> map) {
              authMap.value = map;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Text(
                "Email: ${authMap.value['email']}",
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return Text(
                "Password: ${authMap.value['password']}",
              );
            }),
          ),
        ],
      ),
    );
  }
}
