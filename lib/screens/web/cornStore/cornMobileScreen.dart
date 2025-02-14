import 'package:flutter/material.dart';
import 'package:sellio/utils/ExpenseTable.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/create_new_button.dart';


class ExpensesMobileScreen extends StatefulWidget {
  const ExpensesMobileScreen({super.key});

  @override
  State<ExpensesMobileScreen> createState() => _ExpensesMobileScreenState();
}

class _ExpensesMobileScreenState extends State<ExpensesMobileScreen> {
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ExpensesTable();
  }


}