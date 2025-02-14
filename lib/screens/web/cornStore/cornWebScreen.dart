import 'package:flutter/material.dart';
import 'package:sellio/utils/ExpenseTable.dart';

class ExpensesWebScreen extends StatefulWidget {
  const ExpensesWebScreen({super.key});

  @override
  State<ExpensesWebScreen> createState() => _ExpensesWebScreenState();
}

class _ExpensesWebScreenState extends State<ExpensesWebScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const ExpensesTable();
  }
}




