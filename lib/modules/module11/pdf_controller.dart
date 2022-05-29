import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:working_on_technics/modules/module11/pdf_api.dart';
import 'package:working_on_technics/modules/module11/pdf_displayer.dart';
import 'package:working_on_technics/modules/module11/pdf_receipt_api.dart';
import 'package:working_on_technics/modules/module11/receipt.dart';

class PdfController extends GetxController {
  //var doc = Rxn<PDFDocument>();
  var isLoading = false.obs;
  var pdfDoc = Rxn<Future<Uint8List>>();

  loadPdf(Receipt receipt) async {
    isLoading.value = true;
    // final pdfFile = await PdfReceiptApi.generate(receipt);
    pdfDoc.value = PdfReceiptApi.preview(receipt);
    // PdfApi.openFile(pdfFile);

    // doc.value = await PDFDocument.fromFile(pdfFile);
    isLoading.value = false;
    Get.to(() => PdfDisplayer());
  }
}
