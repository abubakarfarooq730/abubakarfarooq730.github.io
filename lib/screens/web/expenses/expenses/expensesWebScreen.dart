import 'package:flutter/material.dart';
import 'package:sellio/utils/expensesCategoryTable.dart';
import '../../../../utils/product_table.dart';

class ExpensesCategoryWebScreen extends StatefulWidget {
  const ExpensesCategoryWebScreen({super.key});

  @override
  State<ExpensesCategoryWebScreen> createState() => _ExpensesCategoryWebScreenState();
}

class _ExpensesCategoryWebScreenState extends State<ExpensesCategoryWebScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const ExpensesCategoryTable();
  }
}




