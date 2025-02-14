import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class PurchaseReturnScreen extends StatefulWidget {
  @override
  State<PurchaseReturnScreen> createState() => _PurchaseReturnScreenState();
}

class _PurchaseReturnScreenState extends State<PurchaseReturnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Purchase Return Screen")));
  }
}
