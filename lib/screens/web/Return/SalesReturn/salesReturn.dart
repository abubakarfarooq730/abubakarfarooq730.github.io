import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SalesReturnScreen extends StatefulWidget {
  @override
  State<SalesReturnScreen> createState() => _SalesReturnScreenState();
}

class _SalesReturnScreenState extends State<SalesReturnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.simpleWhiteColor,
        body: Center(child: Text("Sales Return Screen")));
  }
}
