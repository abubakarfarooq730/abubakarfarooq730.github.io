import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'purchase_return_report_mobileScreen.dart';
import 'purchase_return_report_webScreen.dart';



class PurchaseReturnReportHome extends StatelessWidget {
  const PurchaseReturnReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const PurchaseReturnReportMobileScreen(),
      desktop: (BuildContext context) => const PurchaseReturnReportWebScreen(),
    );
  }
}
