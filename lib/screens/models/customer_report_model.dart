class CustomerReport {
  final int saleNumber;
  final String date;
  final String item;
  final double subtotal;
  final double discount;
  final double tax;
  final double extraAmount;
  final double grandTotal;
  final double paid;
  final double remaining;

  CustomerReport(
      this.saleNumber,
      this.date,
      this.item,
      this.subtotal,
      this.discount,
      this.tax,
      this.extraAmount,
      this.grandTotal,
      this.paid,
      this.remaining);
}