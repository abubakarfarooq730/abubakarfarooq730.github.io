import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

import '../../../utils/custom_textform_field.dart';

class SystemMobileScreen extends StatefulWidget {
  const SystemMobileScreen({super.key});

  @override
  State<SystemMobileScreen> createState() => _SystemMobileScreenState();
}

class _SystemMobileScreenState extends State<SystemMobileScreen> {
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController currencySymbol = TextEditingController();
  final TextEditingController receiptController = TextEditingController();
  final TextEditingController dateFormatController = TextEditingController();
  final TextEditingController purchaseInvoiceController =
      TextEditingController();
  final TextEditingController saleInvoiceController = TextEditingController();
  final TextEditingController quotationInvoiceController =
      TextEditingController();

  String currencySymbolPosition = 'Pre';
  String selectedLanguage = 'English';
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      body: Padding(
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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 4,
                    width: 50,
                    color: Colors.blue,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Main Content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'System Settings',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Currency'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText:
                                                "Sale Invoice Footer Title",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller: currencyController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Currency Symbol'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText: "Currency Symbol",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller: currencySymbol,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Text('Currency Symbol Position:'),
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 'Pre',
                                          groupValue: currencySymbolPosition,
                                          onChanged: (value) {
                                            setState(() {
                                              currencySymbolPosition =
                                                  value.toString();
                                            });
                                          },
                                        ),
                                        const Text('Pre'),
                                        Radio(
                                          value: 'Post',
                                          groupValue: currencySymbolPosition,
                                          onChanged: (value) {
                                            setState(() {
                                              currencySymbolPosition =
                                                  value.toString();
                                            });
                                          },
                                        ),
                                        const Text('Post'),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Receipt Type'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText: "Receipt Type",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller: receiptController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Date Format'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText: "Date Format",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller: dateFormatController,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Purchase Invoice Prefix'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText: "Purchase Invoice Prefix",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller:
                                                purchaseInvoiceController,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Sale Invoice Prefix'),
                                          const SizedBox(height: 8),
                                          CustomTextFormField(
                                            hintText: "Sale Invoice Prefix",
                                            fillColor: AppColors
                                                .whiteBorderColor
                                                .withOpacity(0.2),
                                            borderColor:
                                                AppColors.whiteBorderColor,
                                            focusedBorderColor:
                                                AppColors.whitePrimaryButton,
                                            controller: saleInvoiceController,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                CustomTextFormField(
                                  hintText: "Quotation Invoice Prefix",
                                  fillColor: AppColors.whiteBorderColor
                                      .withOpacity(0.2),
                                  borderColor: AppColors.whiteBorderColor,
                                  focusedBorderColor:
                                      AppColors.whitePrimaryButton,
                                  controller: quotationInvoiceController,
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: selectedLanguage,
                                  decoration: InputDecoration(
                                    labelText: 'System Language',
                                    filled: true,
                                    fillColor: Colors.grey.shade100,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  items: const [
                                    DropdownMenuItem(
                                      value: 'English',
                                      child: Text('English'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Spanish',
                                      child: Text('Spanish'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Show Previous Balance Due in Receipt',
                                      style: GoogleFonts.nunito(fontSize: 12),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
