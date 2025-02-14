import 'package:flutter/material.dart';
import 'package:sellio/utils/saleTable.dart';
import '../../../../../utils/product_table.dart';

class SaleWebScreen extends StatefulWidget {
  const SaleWebScreen({super.key});

  @override
  State<SaleWebScreen> createState() => _SaleWebScreenState();
}

class _SaleWebScreenState extends State<SaleWebScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const SalesTable();
  }
}




