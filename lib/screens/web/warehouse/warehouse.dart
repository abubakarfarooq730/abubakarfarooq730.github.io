import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class WarehousesScreen extends StatefulWidget {
  @override
  State<WarehousesScreen> createState() => _WarehousesScreenState();
}

class _WarehousesScreenState extends State<WarehousesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text ("Warehouses Screen")));
  }
}