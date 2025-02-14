import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

import '../../../utils/custom_textform_field.dart';

class FooterDetails extends StatefulWidget {
  const FooterDetails({super.key});

  @override
  State<FooterDetails> createState() => _FooterDetailsState();
}

class _FooterDetailsState extends State<FooterDetails> {
  final TextEditingController saleInvoiceController = TextEditingController();
  final TextEditingController saleInvoice2Controller = TextEditingController();
  final TextEditingController quotationController = TextEditingController();
  final TextEditingController quotation2Controller = TextEditingController();
  final TextEditingController purchaseController = TextEditingController();
  final TextEditingController purchase2Controller = TextEditingController();

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
                  'Footer Detail',
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
                          const Text('Sale Invoice Footer Title'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Sale Invoice Footer Title",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: saleInvoiceController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sale Invoice Footer Notes'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Sale Invoice Footer Notes",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: saleInvoice2Controller,
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
                          const Text('Quotation Invoice Footer Title'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Quotation Invoice Footer Title",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: quotationController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Quotation Invoice Footer Notes'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Quotation Invoice Footer Notes",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: quotation2Controller,
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
                          const Text('Purchase Invoice Footer Title'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Purchase Invoice Footer Title",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: purchaseController,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Purchase Invoice Footer Notes'),
                          const SizedBox(height: 8),
                          CustomTextFormField(
                            hintText: "Purchase Invoice Footer Notes",
                            fillColor:
                                AppColors.whiteBorderColor.withOpacity(0.2),
                            borderColor: AppColors.whiteBorderColor,
                            focusedBorderColor: AppColors.whitePrimaryButton,
                            controller: purchase2Controller,
                          ),
                        ],
                      ),
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
