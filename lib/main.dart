import 'package:flutter/material.dart';
import 'package:sellio/responsive_layout_screen.dart';

void main() async{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayoutScreen(),
    );
  }
}
