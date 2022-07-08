import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:working_on_technics/modules/module13/models/address/address.dart';
import 'package:working_on_technics/modules/module13/models/person/person.dart';

import '../../main.dart';

class Hiving extends StatefulWidget {
  const Hiving({Key? key}) : super(key: key);

  @override
  State<Hiving> createState() => _HivingState();
}

class _HivingState extends State<Hiving> {
  late Box<Person> contacts;

  @override
  initState() {
    initHiving();
    super.initState();
  }

  initHiving() async {
    contacts = Hive.box<Person>("contacts");
  }

  @override
  dispose() {
    contacts.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 235, 215),
      appBar: AppBar(title: const Text('Hive Tuto')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String name = "";
          String addr = "";
          String addr2 = "";
          // contacts.add(Person(name: "New Person", addresses: []));
          Get.defaultDialog(
            title: "Add Person",
            content: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Address",
                  ),
                  onChanged: (value) {
                    addr = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: "Address2",
                  ),
                  onChanged: (value) {
                    addr2 = value;
                  },
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                child: const Text("Cancel"),
                onPressed: () => Get.back(),
              ),
              ElevatedButton(
                child: const Text("Add"),
                onPressed: () {
                  setState(() {
                    contacts.add(
                      Person(name: name, addresses: [
                        Address(address: addr),
                        Address(address: addr2),
                      ]),
                    );
                    Get.back();
                  });
                },
              ),
            ],
          );
        },
        child: const Icon(Icons.add),
      ),
      body: contacts.values.isEmpty
          ? const Text('No data')
          : ListView.builder(
              itemCount: contacts.values.length,
              itemBuilder: (context, index) {
                Person? contact = contacts.values.elementAt(index);
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.addresses.join(", ")),
                );
              },
            ),
    );
  }
}
