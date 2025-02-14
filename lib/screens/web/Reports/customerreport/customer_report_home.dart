import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/reports/customerstatement/customer_statement_webscreen.dart';

import 'customer_report_mobilescreen.dart';
import 'customer_report_webscreen.dart';



class CustomerReportHome extends StatelessWidget {
  const CustomerReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const CustomerReportMobileScreen(),
      desktop: (BuildContext context) => const CustomerReportWebScreen(),
    );
  }
}
