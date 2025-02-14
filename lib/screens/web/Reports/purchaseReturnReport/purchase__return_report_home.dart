import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'purchase_report_mobilescreen.dart';
import 'purchase_report_webscreen.dart';



class PurchaseReportHome extends StatelessWidget {
  const PurchaseReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const PurchaseReportMobileScreen(),
      desktop: (BuildContext context) => const PurchaseReportWebScreen(),
    );
  }
}
