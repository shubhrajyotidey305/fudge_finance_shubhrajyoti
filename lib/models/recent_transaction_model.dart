class RecentTransactionModel {
  RecentTransactionModel({
    required this.logo,
    required this.name,
    required this.country,
    required this.amount,
    required this.date,
    required this.isProcessing,
  });

  String logo;
  String name;
  String country;
  String amount;
  String date;
  bool isProcessing;
}
