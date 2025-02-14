import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/Items/units/unit_mobile_screen.dart';
import 'package:sellio/screens/Items/units/unit_web_screen.dart';

class UnitScreen extends StatefulWidget {
  const UnitScreen({super.key});

  @override
  State<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const UnitMobileScreen(),
      desktop: (BuildContext context) => const UnitWebScreen(),
    );
  }
}
