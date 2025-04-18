class TxnDetails {
  TxnDetails({
    required this.txnrefno,
    required this.amount,
    required this.upi,
    required this.date,
    required this.name,
  });

  final String? txnrefno;
  final String? amount;
  final String? upi;
  final String? date;
  final String? name;

  factory TxnDetails.fromJson(Map<String, dynamic> json) {
    return TxnDetails(
      txnrefno: json["txnrefno"],
      amount: json["amount"],
      upi: json["upi"],
      date: json["date"],
      name: json["name"],
    );
  }
}
