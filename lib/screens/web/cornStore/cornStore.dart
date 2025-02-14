import 'package:flutter/material.dart';
import 'package:sellio/constants/colors.dart';

class CornStoreScreen extends StatefulWidget {
  @override
  State<CornStoreScreen> createState() => _CornStoreScreenState();
}

class _CornStoreScreenState extends State<CornStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Corn Store Screen")));
  }
}
