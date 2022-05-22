import 'package:flutter/material.dart';
import 'package:working_on_technics/modules/module9/whatever_screen.dart';

class WindowWithMenuScreen extends StatelessWidget {
  WindowWithMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                TextButton(onPressed: () {}, child: const Text('File')),
                TextButton(onPressed: () {}, child: const Text('Edit')),
                TextButton(onPressed: () {}, child: const Text('Selection')),
                TextButton(onPressed: () {}, child: const Text('Find')),
                TextButton(onPressed: () {}, child: const Text('View')),
                TextButton(onPressed: () {}, child: const Text('Goto')),
                TextButton(onPressed: () {}, child: const Text('Tools')),
                TextButton(onPressed: () {}, child: const Text('Project')),
                TextButton(onPressed: () {}, child: const Text('Preferences')),
                TextButton(onPressed: () {}, child: const Text('Help')),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              const Expanded(child: Text("This is it")),
              Expanded(child: WhateverScreen(
                callBack: (value) {
                  print("value : $value");
                },
              )),
            ],
          ),
        ),
      ]),
    );
  }
}
