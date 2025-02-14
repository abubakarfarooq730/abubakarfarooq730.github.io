import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/Items/category/category_mobile_screen.dart';
import 'package:sellio/screens/Items/category/category_web_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const CategoryMobileScreen(),
      desktop: (BuildContext context) => const CategoryWebScreen(),
    );
  }
}
