import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

class ReportMobileScreen extends StatefulWidget {
  const ReportMobileScreen({super.key});

  @override
  State<ReportMobileScreen> createState() => _ReportMobileScreenState();
}

class _ReportMobileScreenState extends State<ReportMobileScreen> {
  final List<Map<String, dynamic>> reportList = [
    {'title': 'Users Report', 'icon': Icons.person},
    {'title': 'Sales Report', 'icon': Icons.shopping_cart},
    {'title': 'Purchases Report', 'icon': Icons.shopping_bag},
    {'title': 'Sale Returns Report', 'icon': Icons.assignment_return},
    {'title': 'Purchase Returns Report', 'icon': Icons.assignment_returned},
    {'title': 'Inventory Report', 'icon': Icons.inventory},
    {'title': 'Payments Report', 'icon': Icons.payment},
    {'title': 'Customers Report', 'icon': Icons.people},
    {'title': 'Suppliers Report', 'icon': Icons.store},
    {'title': 'Customers Statement', 'icon': Icons.receipt},
    {'title': 'Suppliers Statement', 'icon': Icons.receipt_long},
    {'title': 'Products Report', 'icon': Icons.category},
    {'title': 'Categories Report', 'icon': Icons.list},
    {'title': 'Brands Report', 'icon': Icons.branding_watermark},
    {'title': 'Taxes Report', 'icon': Icons.request_quote},
    {'title': 'Discount Report', 'icon': Icons.local_offer},
    {'title': 'Expense Report', 'icon': Icons.money_off},
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
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3.5,
                  ),
                  itemCount: reportList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.simpleWhiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.whiteBorderColor, width: 0.4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(reportList[index]['icon'], color: AppColors.buttonColor),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              reportList[index]['title'],
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.bricolageGrotesque(
                                fontSize: 14,
                                color: AppColors.blackColor.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ],
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
