import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class InventoryScreen extends StatefulWidget {
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Inventory Screen")));
  }
}
