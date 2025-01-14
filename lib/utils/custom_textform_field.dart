import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final Color fillColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final TextEditingController? controller;
  final double borderRadius;
  final double borderWidth;
  final bool isFilled;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    required this.fillColor,
    required this.borderColor,
    required this.focusedBorderColor,
    this.controller,
    this.borderRadius = 10.0,
    this.borderWidth = 1.5,
    this.isFilled = true,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.whitePrimaryButton,
      style: GoogleFonts.bricolageGrotesque(
          color: AppColors.whitePrimaryButton,
          fontWeight: FontWeight.w500
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            GoogleFonts.bricolageGrotesque(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
        fillColor: fillColor,
        filled: isFilled,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
        ),
      ),
    );
  }
}
