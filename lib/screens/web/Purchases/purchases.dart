import 'package:flutter/material.dart';

import '../../constants/colors.dart';
class PurchasesScreen extends StatefulWidget {
  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Purchases Screen")));
  }
}
