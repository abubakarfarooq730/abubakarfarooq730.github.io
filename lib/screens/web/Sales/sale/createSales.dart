import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/customTextFormField.dart';
import 'package:sellio/utils/customerGenderDropdown.dart';
import '../../../../../constants/colors.dart';

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});
  @override
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final TextEditingController itemTitleController = TextEditingController();
  final TextEditingController barcodeController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController restockAlertController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController wholesalePriceController = TextEditingController();
  final TextEditingController distributorPriceController = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController cylinderWeightController = TextEditingController();

  String? selectedBrand;
  String? selectedCategory;
  String? selectedUnit;
  String? minUnit;
  String? maxUnit;
  bool isMultiUnit = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Add Product",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: itemTitleController,
                          labelText: "Item Title*",
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: barcodeController,
                          labelText: "Barcode",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                "Enter if item is Cylinder",
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: cylinderWeightController,
                labelText: "Cylinder Weight",
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: CustomDropdown(
                      labelText: "Brand*",
                      items: ["Brand A", "Brand B", "Brand C"],
                      selectedValue: selectedBrand,
                      onChanged: (value) {
                        setState(() {
                          selectedBrand = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDropdown(
                      labelText: "Category*",
                      items: ["Category X", "Category Y", "Category Z"],
                      selectedValue: selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: skuController,
                labelText: "SKU",
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: restockAlertController,
                labelText: "Restock Alert",
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Multi Units"),
                  Checkbox(
                    value: isMultiUnit,
                    onChanged: (value) {
                      setState(() {
                        // Toggle between single and multi-unit mode
                        isMultiUnit = value!;

                        // Reset values when toggling
                        if (!isMultiUnit) {
                          minUnit = null;
                          maxUnit = null;
                        } else {
                          selectedUnit = null;
                        }
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  if (isMultiUnit)
                    Expanded(
                      child: CustomDropdown(
                        labelText: "Min Unit",
                        items: ["Unit 1", "Unit 2", "Unit 3"],
                        selectedValue: minUnit,
                        onChanged: (value) {
                          setState(() {
                            minUnit = value;
                          });
                        },
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (isMultiUnit)
                    Expanded(
                      child: CustomDropdown(
                        labelText: "Max Unit",
                        items: ["Unit 1", "Unit 2", "Unit 3"],
                        selectedValue: maxUnit,
                        onChanged: (value) {
                          setState(() {
                            maxUnit = value;
                          });
                        },
                      ),
                    )
                  else
                    Expanded(
                      child: CustomDropdown(
                        labelText: "Unit",
                        items: ["Unit A", "Unit B", "Unit C"],
                        selectedValue: selectedUnit,
                        onChanged: (value) {
                          setState(() {
                            selectedUnit = value;
                          });
                        },
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: retailPriceController,
                      labelText: "Retail Price",
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      controller: wholesalePriceController,
                      labelText: "Wholesale Price",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: distributorPriceController,
                labelText: "Distributor Price",
              ),
              const SizedBox(height: 16),

              CustomTextField(
                controller: description,
                labelText: "Description",
                maxLines: 4,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(8),
                      child: Center(
                        child:  Text(
                          "Cancel",
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
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
    );
  }
}
