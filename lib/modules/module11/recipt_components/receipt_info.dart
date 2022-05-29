class ReceiptInfo {
  final DateTime date;
  final DateTime dueDate;
  final String description;
  final String number;
  final double vat;

  ReceiptInfo({
    required this.date,
    required this.dueDate,
    required this.description,
    required this.number,
    required this.vat,
  });
}
