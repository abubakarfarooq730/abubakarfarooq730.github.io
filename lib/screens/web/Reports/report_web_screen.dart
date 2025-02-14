import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/screens/reports/customerreport/customer_report_home.dart';
import 'package:sellio/screens/reports/usersreport/users_report_web_screen.dart';

import 'customerstatement/customer_statement_home.dart';
import 'customerstatement/customer_statement_webscreen.dart';

class ReportWebScreen extends StatefulWidget {
  const ReportWebScreen({super.key});

  @override
  State<ReportWebScreen> createState() => _ReportWebScreenState();
}

class _ReportWebScreenState extends State<ReportWebScreen> {
  final List<Map<String, dynamic>> reportList = [
    {'title': 'Users Report', 'icon': Icons.person, 'route': const UsersReportWebScreen()},
    {'title': 'Sales Report', 'icon': Icons.shopping_cart, 'route': null},
    {'title': 'Purchases Report', 'icon': Icons.shopping_bag, 'route': null},
    {'title': 'Sale Returns Report', 'icon': Icons.assignment_return, 'route': null},
    {'title': 'Purchase Returns Report', 'icon': Icons.assignment_returned, 'route': null},
    {'title': 'Inventory Report', 'icon': Icons.inventory, 'route': null},
    {'title': 'Payments Report', 'icon': Icons.payment, 'route': null},
    {'title': 'Customers Report', 'icon': Icons.people, 'route': const CustomerReportHome()},
    {'title': 'Suppliers Report', 'icon': Icons.store, 'route': null},
    {'title': 'Customers Statement', 'icon': Icons.receipt, 'route': const CustomerStatementHome()},
    {'title': 'Suppliers Statement', 'icon': Icons.receipt_long, 'route': null},
    {'title': 'Products Report', 'icon': Icons.category, 'route': null},
    {'title': 'Categories Report', 'icon': Icons.list, 'route': null},
    {'title': 'Brands Report', 'icon': Icons.branding_watermark, 'route': null},
    {'title': 'Taxes Report', 'icon': Icons.request_quote, 'route': null},
    {'title': 'Discount Report', 'icon': Icons.local_offer, 'route': null},
    {'title': 'Expense Report', 'icon': Icons.money_off, 'route': null},
  ];

  void navigateToReportScreen(BuildContext context, Widget? screen) {
    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }


  void showCustomerStatementDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const CustomerStatementWebScreen(),
    );
  }


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
                "Reports",
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 16,
                  color: AppColors.blackColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 12,
                  ),
                  itemCount: reportList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (reportList[index]['title'] == 'Customers Statement') {
                          // showCustomerStatementDialog(context);
                        } else {
                          navigateToReportScreen(context, reportList[index]['route']);
                        }
                      },
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.simpleWhiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.whiteBorderColor, width: 0.4),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Icon(reportList[index]['icon'], color: AppColors.buttonColor),
                            const SizedBox(width: 20),
                            Text(
                              reportList[index]['title'],
                              style: GoogleFonts.bricolageGrotesque(
                                fontSize: 16,
                                color: AppColors.blackColor.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
