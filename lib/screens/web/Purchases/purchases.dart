import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/web/Purchases/purchasesMobileScreen.dart';
import 'package:sellio/screens/web/Purchases/purchasesWebScreen.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen({super.key});

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const PurchasesMobileScreen(),
      desktop: (BuildContext context) => const PurchasesWebScreen(),
    );
  }
}
