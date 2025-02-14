import 'package:flutter/material.dart';
import 'package:sellio/utils/saleTable.dart';
import 'package:sellio/utils/salesTableMobile.dart';
import '../../../../../utils/product_table.dart';

class SaleMobileScreen extends StatefulWidget {
  const SaleMobileScreen({super.key});

  @override
  State<SaleMobileScreen> createState() => _SaleMobileScreenState();
}

class _SaleMobileScreenState extends State<SaleMobileScreen> {
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SalesTableMobile();
  }

}
