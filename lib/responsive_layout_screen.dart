import 'package:flutter/material.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/screens/mobile/auth/welcome_login_screen.dart';
import 'package:sellio/screens/web/web_login_screen.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mobilePartBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 768) {
            return WebLoginUI();
          } else {
            return MobileLoginUI();
          }
        },
      ),
    );
  }
}