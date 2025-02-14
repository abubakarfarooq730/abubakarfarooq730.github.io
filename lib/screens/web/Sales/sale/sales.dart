import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/constants/customTextFormField.dart';
import 'package:sellio/utils/customerGenderDropdown.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  String? selectedCustomer;
  TextEditingController billNoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
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
                          labelText: 'Date Due',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    color: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('PRODUCT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('QTY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('PRICE',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('DISC',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('TAX',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('SUB TOTAL',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('title'),
                              Text('1 kg'),
                              Text('Rs 555.0'),
                              Text('Rs 0.0'),
                              Text('Rs 0.0'),
                              Text('Rs 555.0'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
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
                  )
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
                  Wrap(
                    spacing: 8,
                    children: List.generate(
                      10,
                      (index) => Chip(
                        label: Text('Category $index'),
                        backgroundColor:
                            index == 3 ? Colors.blue : Colors.grey.shade300,
                        labelStyle: TextStyle(
                            color: index == 3 ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            child: const Icon(Icons.image, color: Colors.blue),
                          ),
                          title: const Text('title'),
                          subtitle: const Text(
                              'Sale Rate: Rs 555.0\nWholesale: Rs 666.0'),
                          trailing: const Text('0 kilogram'),
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  const Text(
                    'GRAND TOTAL - Rs 550.0',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
