import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/customTextFormField.dart';
import 'package:sellio/utils/customerGenderDropdown.dart';
import '../../../../../constants/colors.dart';

class AddSaleDialog extends StatefulWidget {
  const AddSaleDialog({super.key});
  @override
  _AddSaleDialogState createState() => _AddSaleDialogState();
}

class _AddSaleDialogState extends State<AddSaleDialog> {
  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController billNoController = TextEditingController();
  final TextEditingController restockAlertController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController distributorPriceController = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController cylinderWeightController = TextEditingController();

  String? selectedCustomer;
  int selectedCategoryIndex = 0; // Default selection for Categories
  int selectedBrandIndex = 0; // Default selection for Brands


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.webPartBackgroundColor,
        title: Text(
          'Add New Sale',
          style: GoogleFonts.bricolageGrotesque(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: billNoController,
                          labelText: 'Bill No.',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomTextField(
                          controller: dateController,
                          labelText: 'Date',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: CustomTextField(
                          controller: dueDateController,
                          labelText: 'Due Date',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('PRODUCT')),
                            DataColumn(label: Text('QTY')),
                            DataColumn(label: Text('PRICE')),
                            DataColumn(label: Text('DISC')),
                            DataColumn(label: Text('TAX')),
                            DataColumn(label: Text('SUB TOTAL')),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('Title')),
                              DataCell(Text('1 kg')),
                              DataCell(Text('Rs 555.0')),
                              DataCell(Text('Rs 0.0')),
                              DataCell(Text('Rs 0.0')),
                              DataCell(Text('Rs 555.0')),
                            ]),
                            // Add more rows as needed
                          ],
                          decoration: BoxDecoration(
                            color: AppColors.appColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          headingTextStyle: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          dataRowColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              return Colors.white;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabelWithValue(label: 'ITEMS', value: '1'),
                            _buildLabelWithValue(
                                label: 'TOTAL', value: 'Rs 555.0'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLabelWithValue(
                                label: 'DISCOUNT',
                                value: 'Rs 0.0',
                                isEditable: true),
                            _buildLabelWithValue(
                                label: 'TAX',
                                value: 'Rs 0.0',
                                isEditable: true),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                padding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'CONFIRM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: _buildColoredButton(
                                    label: 'EXIT',
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildColoredButton(
                                    label: 'SUSPEND',
                                    color: Colors.amber,
                                    onPressed: () {},
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildColoredButton(
                                    label: 'HOLD',
                                    color: Colors.blue,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          labelText: "Customer*",
                          items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
                          selectedValue: selectedCustomer,
                          onChanged: (value) {
                            selectedCustomer = value;
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 15),
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Add",
                                style: GoogleFonts.bricolageGrotesque(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: searchController,
                    cursorColor: AppColors.buttonColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Product Name / SKU / Scan Bar Code',
                      hintStyle: GoogleFonts.bricolageGrotesque(),
                      focusColor: AppColors.buttonColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.buttonColor, width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 8,
                          children: List.generate(
                            10,
                                (index) => ChoiceChip(
                              label: Text(index == 0 ? 'All Categories' : 'Category $index'),
                              selected: selectedCategoryIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  selectedCategoryIndex = index;
                                });
                              },
                              selectedColor: AppColors.appColor,
                              backgroundColor: Colors.grey.shade300,
                              labelStyle: GoogleFonts.bricolageGrotesque(
                                color: selectedCategoryIndex == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 8,
                          children: List.generate(
                            10,
                                (index) => ChoiceChip(
                              label: Text(index == 0 ? 'All Brands' : 'Brand $index'),
                              selected: selectedBrandIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  selectedBrandIndex = index;
                                });
                              },
                              selectedColor: AppColors.appColor,
                              backgroundColor: Colors.grey.shade300,
                              labelStyle: GoogleFonts.bricolageGrotesque(
                                color: selectedBrandIndex == index ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child:  Icon(Icons.image, color: AppColors.appColor),
                          ),
                          title:  Text('Title',style: GoogleFonts.bricolageGrotesque(),),
                          subtitle:  Text(
                              'Sale Rate: Rs 555.0,  Wholesale: Rs 666.0',style: GoogleFonts.bricolageGrotesque(),),
                          trailing:  Text('0 kilogram',style: GoogleFonts.bricolageGrotesque(),),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                   Align(
                     alignment: AlignmentDirectional.centerStart,
                     child: Text(
                      'GRAND TOTAL - Rs 550.0',
                      style: GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.bold, fontSize: 18),
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

  Widget _buildLabelWithValue({
    required String label,
    required String value,
    bool isEditable = false,
  }) {
    return Row(
      children: [
        Text(
          '$label:',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 4),
        isEditable
            ? Row(
          children: [
            Text(value),
            const SizedBox(width: 4),
            Icon(Icons.edit, size: 16, color: Colors.grey),
          ],
        )
            : Text(value),
      ],
    );
  }

  Widget _buildColoredButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      ),
      child: Text(
        label,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColors.whiteBackground),
      ),
    );
  }
}