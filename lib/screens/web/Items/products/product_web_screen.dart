import 'package:flutter/material.dart';
import '../../../utils/product_table.dart';

class ProductWebScreen extends StatefulWidget {
  const ProductWebScreen({super.key});

  @override
  State<ProductWebScreen> createState() => _ProductWebScreenState();
}

class _ProductWebScreenState extends State<ProductWebScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const ProductsTable();
  }
}




