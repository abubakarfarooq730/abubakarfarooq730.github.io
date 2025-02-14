import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'sales_report_mobilescreen.dart';
import 'sales_report_webscreen.dart';



class CustomerReportHome extends StatelessWidget {
  const CustomerReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const SalesReportMobileScreen(),
      desktop: (BuildContext context) => const SalesReportWebScreen(),
    );
  }
}
