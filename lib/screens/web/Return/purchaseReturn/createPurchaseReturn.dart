import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/screens/web/Purchases/addExtraAmountDialogue.dart';

import '../../../../constants/customTextFormField.dart';
import '../../../../utils/customerGenderDropdown.dart';
import '../../../../utils/indicatorHeadings.dart';

class CreatePurchaseReturnScreen extends StatefulWidget {
  const CreatePurchaseReturnScreen({super.key});

  @override
  State<CreatePurchaseReturnScreen> createState() => _CreatePurchaseReturnScreenState();
}

class _CreatePurchaseReturnScreenState extends State<CreatePurchaseReturnScreen> {
  TextEditingController purchaseNoController = TextEditingController();
  TextEditingController purchaseNoteController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  TextEditingController supplierNameController = TextEditingController();
  TextEditingController amountPayedController = TextEditingController();

  String? selectedWarehouse;
  String? selectedSupplier;
  String? selectedMethod;

  bool hasLineItems = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.webPartBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.webPartBackgroundColor,
        title: Text(
          'Add New Purchase',
          style: GoogleFonts.bricolageGrotesque(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndicatorHeading('Basic Information'),
                    const SizedBox(height: 16),
                    Text("Purchase Reference",style: GoogleFonts.bricolageGrotesque(
                      fontSize: 16
                    ),),
                    const SizedBox(height: 3),
                    Text("To return, please type the order reference and press enter. The form will be filled with tha purchase information",style: GoogleFonts.bricolageGrotesque(
                        fontSize: 13
                    ),),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: purchaseNoController,
                      labelText: "Purchase No",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseNoController,
                            labelText: "Purchase No",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Supplier",
                            items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
                            selectedValue: selectedSupplier,
                            onChanged: (value) {
                              setState(() {
                                selectedSupplier = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: purchaseDateController,
                      labelText: "Purchase Invoice Date",
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Line Items',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: TextEditingController(),
                      labelText: 'Add product',
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Returning Line Item'),
                    const SizedBox(height: 26),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenWidth < 600 ? 600 : screenWidth,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith(
                                  (states) => AppColors.appColor),
                          columns: [
                            DataColumn(
                                label: Text(
                                  'Product',
                                  style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.white),
                                )),
                            DataColumn(
                              label: Text(
                                'Quantity',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Unit Price',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Discount',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Subtotal',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                          rows: [],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Billing'),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            controller: purchaseNoteController,
                            maxLines: 2,
                            labelText: 'Return Note',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBillingRow("Sub Totals", "Rs 0.0"),
                              const SizedBox(height: 16),
                              _buildDropdownField("Payment Method", "Cash"),
                              const SizedBox(height: 16),
                              _buildInputField(
                                  "Amount Re-Funded", amountPayedController),
                              const SizedBox(height: 16),
                              Column(
                                children: [
                                  _buildActionButton(
                                  "Confirm Return & Print",
                                    Icons.print,
                                    Colors.green,
                                        () {},
                                    context,
                                  ), const SizedBox(height: 16),
                                  _buildActionButton(
                                    "Confirm Return",
                                    Icons.save,
                                    Colors.blue.shade700,
                                        () {},
                                    context,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBillingRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.bricolageGrotesque(fontSize: 16),
        ),
        Text(
          value,
          style: GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildEditableRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.bricolageGrotesque(),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit, size: 16),
            ),
          ],
        ),
        Text(price),
      ],
    );
  }

  Widget _buildDropdownField(String label, String initialValue) {
    return CustomDropdown(
      labelText: label,
      items: ["Cash", "Check", "Debit/Credit Card", "Bank Transfer", "Due"],
      selectedValue: selectedMethod,
      onChanged: (value) {
        setState(() {
          selectedMethod = value;
        });
      },
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return CustomTextField(controller: controller, labelText: label);
  }

  Widget _buildActionButton(String label, IconData icon, Color color,
      Function onTap, BuildContext context) {
    double iconSize =
        MediaQuery.of(context).size.height * 0.025;
    double fontSize =
        MediaQuery.of(context).size.height * 0.018;
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal:
          MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: iconSize),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: GoogleFonts.bricolageGrotesque(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
