import 'dart:ui';

import 'package:flutter/material.dart';

class Module8Screen extends StatelessWidget {
  const Module8Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: const Text('Module 8'),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Center(
            child: Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black45,
              ),
              child: const Center(child: Text('Module 8')),
            ),
          ),
        ),
      ),
    );
  }
}
