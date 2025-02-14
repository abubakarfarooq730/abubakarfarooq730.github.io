import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'discount_mobile_screen.dart';
import 'discount_web_screen.dart';

class DiscountsScreen extends StatefulWidget {
  const DiscountsScreen({super.key});

  @override
  State<DiscountsScreen> createState() => _DiscountsScreenState();
}

class _DiscountsScreenState extends State<DiscountsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const DiscountMobileScreen(),
      desktop: (BuildContext context) => const DiscountWebScreen(),
    );
  }
}
