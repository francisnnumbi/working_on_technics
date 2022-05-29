import 'package:working_on_technics/modules/module11/recipt_components/customer.dart';
import 'package:working_on_technics/modules/module11/recipt_components/receipt_info.dart';
import 'package:working_on_technics/modules/module11/recipt_components/receipt_item.dart';
import 'package:working_on_technics/modules/module11/recipt_components/supplier.dart';

class Receipt {
  final Supplier supplier;
  final Customer customer;
  final ReceiptInfo info;
  final List<ReceiptItem> items;

  Receipt({
    required this.supplier,
    required this.customer,
    required this.info,
    required this.items,
  });
}
