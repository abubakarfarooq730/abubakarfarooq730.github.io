import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class ExpenseCategoriesScreen extends StatefulWidget {
  @override
  State<ExpenseCategoriesScreen> createState() => _ExpenseCategoriesScreenState();
}

class _ExpenseCategoriesScreenState extends State<ExpenseCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Expense Categories Screen")));
  }
}