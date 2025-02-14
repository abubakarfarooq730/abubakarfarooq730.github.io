import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/Items/brand/brand_mobile_screen.dart';
import 'package:sellio/screens/Items/brand/brand_web_screen.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const BrandMobileScreen(),
      desktop: (BuildContext context) => const BrandWebScreen(),
    );
  }
}
