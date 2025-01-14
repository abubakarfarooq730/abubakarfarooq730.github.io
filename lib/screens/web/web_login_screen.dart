import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/screens/web/Home/homeScreen.dart';

import '../../utils/custom_textform_field.dart';

class WebLoginUI extends StatefulWidget {
  const WebLoginUI({super.key});

  @override
  State<WebLoginUI> createState() => _WebLoginUIState();
}

class _WebLoginUIState extends State<WebLoginUI> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.webPartBackgroundColor,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/selliono.png',
                      height: 200,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Sellio Limited",
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 24,
                        color: AppColors.blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "© All rights reserved",
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.bricolageGrotesque(
                      fontSize: 32,
                      letterSpacing: 1.5,
                      color: AppColors.blackColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Please enter your details to login to your account",
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: AppColors.blackColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Email",
                    style: GoogleFonts.bricolageGrotesque(
                      fontSize: 14,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 550,
                    child: CustomTextFormField(
                      hintText: "Email Address",
                      fillColor: AppColors.whiteBorderColor.withOpacity(0.2),
                      borderColor: AppColors.whiteBorderColor,
                      focusedBorderColor: AppColors.whitePrimaryButton,
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Password",
                    style: GoogleFonts.bricolageGrotesque(
                      fontSize: 14,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 550,
                    child: CustomTextFormField(
                      hintText: "Password",
                      fillColor: AppColors.whiteBorderColor.withOpacity(0.2),
                      borderColor: AppColors.whiteBorderColor,
                      focusedBorderColor: AppColors.whitePrimaryButton,
                      controller: passwordController,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 550,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      },
                      color: AppColors.buttonColor,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.bricolageGrotesque(
                          fontSize: 16,
                          color: AppColors.simpleWhiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
