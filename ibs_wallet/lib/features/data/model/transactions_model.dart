class TransactionModel {
  final String transactionId;
  final double amount;
  final String phone;
  final String status;
  final DateTime time;

  TransactionModel({
    required this.transactionId,
    required this.amount,
    required this.phone,
    required this.status,
    required this.time,
  });
}