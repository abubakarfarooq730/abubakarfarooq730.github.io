import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

import '../../../utils/custom_textform_field.dart';

class SettingBrandMobileScreen extends StatefulWidget {
  const SettingBrandMobileScreen({super.key});

  @override
  State<SettingBrandMobileScreen> createState() => _SettingBrandMobileScreenState();
}

class _SettingBrandMobileScreenState extends State<SettingBrandMobileScreen> {
  final TextEditingController businessController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: 50,
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Brand Settings',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.image, size: 50, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.upload_file,
                      color: AppColors.whitePrimaryButton),
                  label: Text('Choose file',
                      style: GoogleFonts.nunito(
                          color: AppColors.whitePrimaryButton)),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Business Title'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Business Title",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: businessController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Registration Number'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Registration Number",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: registrationController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Phone Number'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Phone Number",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: phoneNumberController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email Address'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Email Address",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: emailController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Zip Code'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Zip Code",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: zipCodeController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('City'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "City",
                            fillColor:
                            AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: cityController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Address'),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      hintText: "Address",
                      fillColor: AppColors.whiteBorderColor.withOpacity(0.2),
                      borderColor: AppColors.whiteBorderColor,
                      focusedBorderColor: AppColors.whitePrimaryButton,
                      controller: addressController,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: MaterialButton(
                    onPressed: () {},
                    color: AppColors.buttonColor,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Save Changes",
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 16,
                        color: AppColors.simpleWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
