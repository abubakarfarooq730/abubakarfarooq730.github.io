import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';


class CreateNewButton extends StatelessWidget {
  const CreateNewButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whitePrimaryButton,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "Create New",
        style: GoogleFonts.bricolageGrotesque(
          fontSize: 16,
          color: AppColors.simpleWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
