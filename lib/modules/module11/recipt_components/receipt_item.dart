class ReceiptItem {
  final String description;
  final DateTime date;
  final double unitPrice;
  final int quantity;

  ReceiptItem({
    required this.description,
    required this.date,
    required this.unitPrice,
    required this.quantity,
  });
}
