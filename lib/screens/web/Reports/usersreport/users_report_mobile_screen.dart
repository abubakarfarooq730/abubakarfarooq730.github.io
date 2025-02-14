import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

class UsersReportMobileScreen extends StatefulWidget {
  const UsersReportMobileScreen({super.key});

  @override
  State<UsersReportMobileScreen> createState() => _UsersReportMobileScreenState();
}

class _UsersReportMobileScreenState extends State<UsersReportMobileScreen> {
  final List<Map<String, String>> userReports = [
    {'name': 'John Doe', 'email': 'john@example.com', 'role': 'Admin'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'User'},
    {'name': 'Michael Brown', 'email': 'michael@example.com', 'role': 'Manager'},
    {'name': 'Emily Johnson', 'email': 'emily@example.com', 'role': 'User'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.webPartBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Users Report",
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 20,
                  color: AppColors.blackColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: DataTable(
                  columnSpacing: 20,
                  border: TableBorder.all(color: AppColors.whiteBorderColor, width: 0.5),
                  columns: const [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Role')),
                  ],
                  rows: userReports.map((report) {
                    return DataRow(cells: [
                      DataCell(Text(report['name']!)),
                      DataCell(Text(report['email']!)),
                      DataCell(Text(report['role']!)),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
