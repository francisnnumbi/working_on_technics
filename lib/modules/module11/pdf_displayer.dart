import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:printing/printing.dart';
import 'package:working_on_technics/modules/module11/pdf_controller.dart';

class PdfDisplayer extends StatelessWidget {
  PdfDisplayer({Key? key}) : super(key: key);
  final PdfController pc = Get.find<PdfController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        pc.isLoading.value = false;
        return await Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pdf Displayer'),
        ),
        body: Obx(() {
          return pc.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : PdfPreview(
                  build: (_) => pc.pdfDoc.value!,
                );
        }),
      ),
    );
  }
}
