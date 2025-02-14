import 'package:flutter/material.dart';
import 'package:sellio/utils/sales_return_table.dart';
import '../../../../utils/product_table.dart';

class SalesReturnWebScreen extends StatefulWidget {
  const SalesReturnWebScreen({super.key});

  @override
  State<SalesReturnWebScreen> createState() => _SalesReturnWebScreenState();
}

class _SalesReturnWebScreenState extends State<SalesReturnWebScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const SalesReturnTable();
  }
}




