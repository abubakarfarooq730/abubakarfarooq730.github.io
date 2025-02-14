import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/reports/customerstatement/customer_statement_webscreen.dart';

import 'customer_statement_mobilescreen.dart';

class CustomerStatementHome extends StatelessWidget {
  const CustomerStatementHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const CustomerStatementMobileScreen(),
      desktop: (BuildContext context) => const CustomerStatementWebScreen(),
    );
  }
}
