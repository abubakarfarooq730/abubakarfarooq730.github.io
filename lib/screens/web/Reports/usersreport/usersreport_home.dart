import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/screens/reports/usersreport/users_report_mobile_screen.dart';
import 'package:sellio/screens/reports/usersreport/users_report_web_screen.dart';


class UsersReportHome extends StatelessWidget {
  const UsersReportHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const UsersReportMobileScreen(),
      desktop: (BuildContext context) => const UsersReportWebScreen(),
    );
  }
}
