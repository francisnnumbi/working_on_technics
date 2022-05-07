import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:working_on_technics/modules/module3/note.dart';
import 'package:working_on_technics/modules/module3/notes_controller.dart';

class Module3Screen extends StatelessWidget {
  Module3Screen({Key? key}) : super(key: key) {
    initialize();
  }

  final NotesController notesController = Get.put(NotesController());

  initialize() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage Notes tutorial'),
        actions: [
          CircleAvatar(
            child: Obx(() {
              return Text('${notesController.notes.length}');
            }),
          ),
          const SizedBox(width: 10),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Get.bottomSheet(bottomNewWidget());
              /* notesController.addNote(Note(
                  title: "Just",
                  description: "description",
                  date: DateTime.now()));*/
            },
          ),
        ],
      ),
      body: Center(
        child: Obx(() {
          if (notesController.notes.isEmpty) {
            return const Text("No notes");
          }
          return ListView.builder(
              itemBuilder: (context, index) {
                Note note = notesController.notes[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ListTile(
                        title: Text(note.title),
                        subtitle: Text(note.description),
                        onTap: () {
                          // Get.toNamed('/module3/note', arguments: notesController.notes[index]);
                        },
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            notesController.removeNote(index);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                note.readPriority(),
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                            Text(
                              note.date.toString().substring(0, 19),
                              style: const TextStyle(
                                  fontSize: 10, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: notesController.notes.length);
        }),
      ),
    );
  }

  Widget bottomNewWidget() {
    String title = "";
    String description = "";
    int priority = 0;
    return Container(
      color: Colors.white,
      height: 400,
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            'New Note',
            style: TextStyle(fontSize: 24),
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Title',
              labelText: 'Title',
            ),
            onChanged: (value) {
              title = value;
            },
          ),
          TextField(
            minLines: 5,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Description',
              labelText: 'Description',
            ),
            onChanged: (value) {
              description = value;
            },
          ),
          TextFormField(
            initialValue: '0',
            decoration: const InputDecoration(
              hintText: 'Priority',
              labelText: 'Priority',
            ),
            onChanged: (String value) {
              priority = int.tryParse(value) ?? 0;
            },
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Note _note = Note(
                    title: title,
                    description: description,
                    priority: priority,
                    date: DateTime.now());
                notesController.addNote(_note);
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
