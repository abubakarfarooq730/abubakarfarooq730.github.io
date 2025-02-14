import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  @override
  State<EmployeesScreen> createState() => _EmployeesScreenState();
}

class _EmployeesScreenState extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Employees Screen")));
  }
}
