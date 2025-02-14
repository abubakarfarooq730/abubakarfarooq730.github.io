import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ExpensesScreen extends StatefulWidget {
  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Expenses Screen")));
  }
}
