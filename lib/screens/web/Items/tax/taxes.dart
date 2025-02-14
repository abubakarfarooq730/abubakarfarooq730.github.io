import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/Items/tax/tax_mobile_screen.dart';
import 'package:sellio/screens/Items/tax/tax_web_screen.dart';

class TaxScreen extends StatefulWidget {
  const TaxScreen({super.key});

  @override
  State<TaxScreen> createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const TaxMobileScreen(),
      desktop: (BuildContext context) => const TaxWebScreen(),
    );
  }
}
