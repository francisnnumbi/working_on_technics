import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:working_on_technics/modules/module11/pdf_controller.dart';
import 'package:working_on_technics/modules/module11/pdf_receipt_api.dart';
import 'package:working_on_technics/modules/module11/receipt.dart';
import 'package:working_on_technics/modules/module11/recipt_components/customer.dart';
import 'package:working_on_technics/modules/module11/pdf_displayer.dart';
import 'package:working_on_technics/modules/module11/recipt_components/receipt_info.dart';
import 'package:working_on_technics/modules/module11/recipt_components/receipt_item.dart';
import 'package:working_on_technics/modules/module11/recipt_components/supplier.dart';

class PdfReceiptGenerator extends StatelessWidget {
  PdfReceiptGenerator({Key? key}) : super(key: key);
  final PdfController pc = Get.find<PdfController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pdf Receipt Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.picture_as_pdf, color: Colors.white, size: 150),
            const SizedBox(height: 30),
            const Text(
              "Generate Receipt",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                child: const Text(
                  'Receipt PDF',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () async {
                  final date = DateTime.now();
                  final dueDate = date.add(const Duration(days: 7));

                  final receipt = Receipt(
                    supplier: Supplier(
                      name: 'John Doe',
                      address: '123 Main Street',
                      paymentInfo: 'https://www.paypal.com',
                    ),
                    customer: Customer(
                      name: 'Jane Doe',
                      address: '2 Lukausha Street',
                    ),
                    info: ReceiptInfo(
                      date: date,
                      dueDate: dueDate,
                      description:
                          "It's a long description that makes no sens at all, but it is simply a placeholder for the receipt",
                      number: '${DateTime.now().year}-9999',
                      vat: 0.16,
                    ),
                    items: [
                      ReceiptItem(
                        description: 'Citron',
                        date: DateTime.now(),
                        unitPrice: 100,
                        quantity: 1,
                      ),
                      ReceiptItem(
                        description: 'Banane',
                        date: DateTime.now(),
                        unitPrice: 50,
                        quantity: 2,
                      ),
                      ReceiptItem(
                        description: 'Orange',
                        date: DateTime.now(),
                        unitPrice: 150,
                        quantity: 8,
                      ),
                    ],
                  );
                  // final pdfFile = await PdfReceiptApi.generate(receipt);
                  // PdfApi.openFile(pdfFile);
                  pc.loadPdf(receipt);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
