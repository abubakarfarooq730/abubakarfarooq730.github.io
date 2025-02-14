import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class QuotationsScreen extends StatefulWidget {
  @override
  State<QuotationsScreen> createState() => _QuotationsScreenState();
}

class _QuotationsScreenState extends State<QuotationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Quotations Screen")));
  }
}