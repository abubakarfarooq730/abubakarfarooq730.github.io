import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/utils/indicatorHeadings.dart';

import '../../../../constants/customTextFormField.dart';
import '../../../../provider/emptyCylinderPurchaseProvider.dart';
import '../../../../utils/customerGenderDropdown.dart';
import '../../Purchases/addExtraAmountDialogue.dart';

class AddEmptyCylinderPurchaseScreen extends StatelessWidget {
  const AddEmptyCylinderPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<EmptyCylinderPurchaseProvider>(context);
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
          onPressed: () {
            Navigator.pop(context);
          },
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
                    CustomTextField(
                      controller: purchaseProvider.purchaseNoController,
                      labelText: "Purchase No *",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseProvider.purchaseDateController,
                            labelText: "Purchase Date *",
                            readOnly: true,
                            onTap: () => purchaseProvider.selectDate(context, purchaseProvider.purchaseDateController),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseProvider.dueDateController,
                            labelText: "Due Date",
                            readOnly: true,
                            onTap: () => purchaseProvider.selectDate(context, purchaseProvider.dueDateController),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Warehouse*",
                            items: ["CocaCola", "Peak freaks", "Engro"],
                            selectedValue: purchaseProvider.selectedWarehouse,
                            onChanged: (value) {
                              purchaseProvider.selectedWarehouse = value;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Supplier*",
                            items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
                            selectedValue: purchaseProvider.selectedSupplier,
                            onChanged: (value) {
                              purchaseProvider.selectedSupplier = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Line Item'),
                    const SizedBox(height: 16),
                    CustomDropdown(
                      labelText: 'Add Product',
                      items: ["Product A", "Product B", "Product C"],
                      selectedValue: purchaseProvider.selectedProduct,
                      onChanged: (value) {
                        purchaseProvider.setSelectedProduct(value);
                      },
                    ),
                    const SizedBox(height: 26),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenWidth < 600 ? 600 : screenWidth,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith(
                                (states) => AppColors.appColor,
                          ),
                          columns: [
                            DataColumn(
                              label: Text(
                                'Product',
                                style: GoogleFonts.bricolageGrotesque(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Quantity',
                                style: GoogleFonts.bricolageGrotesque(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Rate',
                                style: GoogleFonts.bricolageGrotesque(color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Sub Total',
                                style: GoogleFonts.bricolageGrotesque(color: Colors.white),
                              ),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text(purchaseProvider.selectedProduct ?? 'No Product')),
                                DataCell(
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: TextFormField(
                                        controller: purchaseProvider.quantityController,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Quantity',
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) => purchaseProvider.updateSubtotal(),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    margin: const EdgeInsets.only(top: 8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: TextFormField(
                                        controller: purchaseProvider.rateController,
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Rate',
                                          contentPadding: EdgeInsets.only(bottom: 10),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) => purchaseProvider.updateSubtotal(),
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(Text('Rs ${purchaseProvider.subTotal.toStringAsFixed(2)}')),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Billing'),
                    const SizedBox(height: 16),
                   screenWidth < 600 ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBillingRow("Sub Totals", "Rs ${purchaseProvider.subTotal.toStringAsFixed(2)}"),
                        const SizedBox(height: 16),
                        _buildDropdownField("Payment Method", "Cash"),
                        const SizedBox(height: 16),
                        _buildInputField("Amount Paid", purchaseProvider.amountPayedController, purchaseProvider.updateAmountPaid),
                        const SizedBox(height: 16),
                        _buildBillingRow("Balance Due", "Rs 0.0"),
                        const SizedBox(height: 16),

                        CustomTextField(
                          controller: purchaseProvider.purchaseNoteController,
                          maxLines: 2,
                          labelText: 'Purchase Note',
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddExtraAmount();
                                },
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Extra Charges",
                                  style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: _buildActionButton(
                                "Save & Print",
                                Icons.print,
                                Colors.green,
                                    () {},
                                context,
                              ),
                            ),
                            screenWidth >= 600
                                ? const SizedBox(width: 16)
                                : const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: _buildActionButton(
                                "Save",
                                Icons.save,
                                Colors.blue.shade700,
                                    () {},
                                context,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) :
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(
                            controller: purchaseProvider.purchaseNoteController,
                            maxLines: 2,
                            labelText: 'Purchase Note',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBillingRow("Sub Totals", "Rs ${purchaseProvider.subTotal.toStringAsFixed(2)}"),
                              const SizedBox(height: 16),
                              _buildDropdownField("Payment Method", "Cash"),
                              const SizedBox(height: 16),
                              _buildInputField("Amount Paid", purchaseProvider.amountPayedController, purchaseProvider.updateAmountPaid),
                              const SizedBox(height: 16),
                              _buildBillingRow("Balance Due", "Rs ${purchaseProvider.balanceDue.toStringAsFixed(2)}"),
                              const SizedBox(height: 16),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddExtraAmount();
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Add Extra Charges",
                                        style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: _buildActionButton(
                                      "Save & Print",
                                      Icons.print,
                                      Colors.green,
                                          () {},
                                      context,
                                    ),
                                  ),
                                  screenWidth >= 600
                                      ? const SizedBox(width: 16)
                                      : const SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                    child: _buildActionButton(
                                      "Save",
                                      Icons.save,
                                      Colors.blue.shade700,
                                          () {},
                                      context,
                                    ),
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
      selectedValue: initialValue,
      onChanged: (value) {
        // Handle dropdown change
      },
    );
  }
  Widget _buildInputField(String label, TextEditingController controller, Function(String) onChanged) {
    return CustomTextField(
      controller: controller,
      labelText: label,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }


  Widget _buildActionButton(String label, IconData icon, Color color,
      Function onTap, BuildContext context) {
    double iconSize =
        MediaQuery.of(context).size.height * 0.022;
    double fontSize =
        MediaQuery.of(context).size.height * 0.015;
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
          children: [
            Icon(icon, color: Colors.white, size: iconSize),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.02),
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