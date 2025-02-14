import 'package:flutter/material.dart';

class EmptyCylinderScreen extends StatefulWidget {
  @override
  State<EmptyCylinderScreen> createState() => _EmptyCylinderScreenState();
}

class _EmptyCylinderScreenState extends State<EmptyCylinderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Empty Cylinder Screen")));
  }
}
