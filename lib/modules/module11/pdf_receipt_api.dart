import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:working_on_technics/modules/module11/pdf_api.dart';
import 'package:working_on_technics/modules/module11/receipt.dart';
import 'package:working_on_technics/modules/module11/recipt_components/customer.dart';
import 'package:working_on_technics/modules/module11/recipt_components/receipt_info.dart';
import 'package:working_on_technics/modules/module11/recipt_components/supplier.dart';
import 'package:working_on_technics/modules/module11/utils.dart';

class PdfReceiptApi {
  static Future<Uint8List> preview(Receipt receipt) async {
    final pdf = Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(
      MultiPage(
        // pageFormat: PdfPageFormat.roll80,
        build: (context) => [
          buildHeader(receipt, font),
          SizedBox(height: 2 * PdfPageFormat.cm),
          buildTitle(receipt, font),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          buildReceipt(receipt, font),
          Divider(),
          buildTotal(receipt, font),
        ],
        footer: (context) => buildFooter(receipt, font),
      ),
    );

    return pdf.save();
  }

  static Future<File> generate(Receipt receipt) async {
    final pdf = Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(
      MultiPage(
        //  pageFormat: PdfPageFormat.roll80,
        build: (context) => [
          buildHeader(receipt, font),
          SizedBox(height: 2 * PdfPageFormat.cm),
          buildTitle(receipt, font),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          buildReceipt(receipt, font),
          Divider(),
          buildTotal(receipt, font),
        ],
        footer: (context) => buildFooter(receipt, font),
      ),
    );

    return PdfApi.saveDocument(name: 'my_receipt.pdf', pdf: pdf);
  }

  static Widget buildHeader(Receipt receipt, Font font) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            buildSupplierAddress(receipt.supplier, font),
            Container(
              width: 50,
              height: 50,
              child: BarcodeWidget(
                data: receipt.info.number,
                barcode: Barcode.qrCode(),
              ),
            )
          ]),
          SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 2,
                  child: buildCustomerAddress(receipt.customer, font),
                ),
                Flexible(
                  flex: 1,
                  child: buildReceiptInfo(receipt.info, font),
                ),
              ]),
        ],
      );

  static Widget buildReceiptInfo(ReceiptInfo info, Font font) {
    final paymentTerms = "${info.dueDate.difference(info.date).inDays} days";
    final titles = <String>[
      'Receipt Number:',
      'Receipt Date:',
      'Payment Terms:',
      'Due Date',
    ];
    final data = <String>[
      info.number,
      Utils.formatDate(info.date),
      paymentTerms,
      Utils.formatDate(info.dueDate),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        return buildText(
            title: titles[index], value: data[index], width: 200, font: font);
      }),
    );
  }

  static Widget buildCustomerAddress(Customer customer, Font font) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customer.name,
            style: TextStyle(
              font: font,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(
            customer.address,
            style: TextStyle(font: font),
          ),
        ],
      );

  static Widget buildSupplierAddress(Supplier supplier, Font font) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            supplier.name,
            style: TextStyle(
              font: font,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(
            supplier.address,
            style: TextStyle(font: font),
          ),
        ],
      );

  static Widget buildFooter(Receipt receipt, Font font) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Address', value: receipt.supplier.address, font: font),
          buildSimpleText(
              title: 'Paypal', value: receipt.supplier.paymentInfo, font: font),
        ],
      );

  static Widget buildTitle(Receipt receipt, Font font) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RECEIPT',
              style: TextStyle(
                  font: font, fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(receipt.info.description,
              style: TextStyle(fontSize: 16, font: font)),
        ],
      );

  static Widget buildReceipt(Receipt receipt, Font font) => Table.fromTextArray(
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold, font: font),
        headerDecoration: const BoxDecoration(
          color: PdfColors.grey300,
          //    border: Border(bottom: BorderSide(width: 1, color: PdfColors.black)),
        ),
        cellHeight: 10,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.centerRight,
          2: Alignment.centerRight,
          3: Alignment.centerRight,
          4: Alignment.centerRight,
        },
        headers: const [
          'Description',
          'Date',
          'Quantity',
          'Unit Price',
          'Total'
        ],
        data: receipt.items.map((item) {
          final total = item.quantity * item.unitPrice;
          return [
            item.description,
            item.date.toString().substring(0, 10),
            item.quantity.toString(),
            "${Utils.formatPrice(item.unitPrice)}",
            "${Utils.formatPrice(total)}",
          ];
        }).toList(),
      );

  static Widget buildTotal(Receipt receipt, Font font) {
    /*final netTotal = receipt.items.fold(0, (sum, item) {
      final a = item.quantity * item.unitPrice;
      final b = a * item.vat;
      final c = a + b;
      return double.parse(sum.toString()) + c;
    });*/
    final netTotal = receipt.items
        .map((item) => item.quantity * item.unitPrice)
        .reduce((sum, item) => sum + item);
    final vatPercent = receipt.info.vat;
    final vat = netTotal * vatPercent;
    final total = netTotal + vat;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(children: [
        Spacer(flex: 6),
        Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                    title: 'Net Total',
                    value: Utils.formatPrice(netTotal),
                    font: font,
                    unite: true),
                buildText(
                    title: 'VAT ${Utils.formatPercent(vatPercent)}',
                    value: Utils.formatPrice(vat),
                    font: font,
                    unite: true),
                Divider(),
                buildText(
                    title: 'Total',
                    value: Utils.formatPrice(total),
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      font: font,
                    ),
                    font: font,
                    unite: true),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            )),
      ]),
    );
  }

  static buildText(
      {required String title,
      required String value,
      double width = double.infinity,
      TextStyle? titleStyle,
      required Font font,
      bool unite = false}) {
    final style =
        titleStyle ?? TextStyle(fontWeight: FontWeight.bold, font: font);
    return Row(children: [
      Expanded(
        child: Text(title, style: style),
      ),
      Text(value, style: unite ? style : TextStyle(font: font)),
    ]);
  }

  static buildSimpleText({
    required String title,
    required String value,
    TextStyle? titleStyle,
    required Font font,
  }) {
    final style =
        titleStyle ?? TextStyle(fontWeight: FontWeight.bold, font: font);
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: style),
          SizedBox(width: 2 * PdfPageFormat.mm),
          Text(value, style: TextStyle(font: font)),
        ]);
  }
}
