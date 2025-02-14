import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'sales_return_report_mobileScreen.dart';
import 'sales_return_report_webScreen.dart';



class SalesReturnReportHome extends StatelessWidget {
  const SalesReturnReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const SalesReturnReportMobileScreen(),
      desktop: (BuildContext context) => const SalesReturnReportWebScreen(),
    );
  }
}
