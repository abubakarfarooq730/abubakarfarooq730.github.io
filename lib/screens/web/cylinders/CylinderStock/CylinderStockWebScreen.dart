import 'package:flutter/material.dart';
import 'package:sellio/utils/emptyCylinderTable.dart';

class EmptyCylinderWebScreen extends StatefulWidget {
  const EmptyCylinderWebScreen({super.key});

  @override
  State<EmptyCylinderWebScreen> createState() => _EmptyCylinderWebScreenState();
}

class _EmptyCylinderWebScreenState extends State<EmptyCylinderWebScreen> {
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return EmptyCylinderTable();
  }
}
