import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/models/tax_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../constants/create_new_button.dart';
import '../../../utils/custom_textform_field_withicon.dart';

class TaxMobileScreen extends StatefulWidget {
  const TaxMobileScreen({super.key});

  @override
  State<TaxMobileScreen> createState() => _TaxMobileScreenState();
}

class _TaxMobileScreenState extends State<TaxMobileScreen> {
  final TextEditingController emailController = TextEditingController();
  int _rowsPerPage = 5;

  final List<Tax> _items = [
    Tax('VAT @ 15%', '15%', 'Percentage'),
    Tax('Tax of cargo', '10%', 'Percentage'),
    Tax('For cargo and shipping', '20%', 'Percentage'),
    Tax('New', '20%', 'Amount'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      body: Container(
        color: AppColors.simpleWhiteColor,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Tax",
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 16,
                    color: AppColors.blackColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: CustomTextFormFieldWithIcon(
                    hintText: "Search Taxs",
                    leadingIcon: Icons.search,
                    fillColor: AppColors.whiteBorderColor.withOpacity(0.2),
                    borderColor: AppColors.whiteBorderColor,
                    focusedBorderColor: AppColors.whitePrimaryButton,
                    controller: emailController,
                  ),
                ),
                ..._buildActionButtonsWithSpacing(),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SfDataGrid(
                        source: ItemDataSource(_items),
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        columnWidthMode: ColumnWidthMode.fill,
                        allowSorting: true,
                        columns: [
                          GridColumn(
                            columnName: 'Label',
                            allowSorting: true,
                            label: Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.grey[300],
                              padding: const EdgeInsets.only(left: 12.0),
                              child: const Text(
                                'Label',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Amount',
                            allowSorting: true,
                            label: Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.grey[300],
                              padding: const EdgeInsets.only(left: 12.0),
                              child: const Text(
                                'Amount',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'Type',
                            allowSorting: true,
                            label: Container(
                              alignment: Alignment.centerLeft,
                              color: Colors.grey[300],
                              padding: const EdgeInsets.only(left: 12.0),
                              child: const Text(
                                'Type',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Rows per page:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8.0),
                              DropdownButton<int>(
                                value: _rowsPerPage,
                                items: const [
                                  DropdownMenuItem(value: 5, child: Text("5")),
                                  DropdownMenuItem(
                                      value: 10, child: Text("10")),
                                  DropdownMenuItem(
                                      value: 20, child: Text("20")),
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _rowsPerPage = value ?? 5;
                                  });
                                },
                              ),
                            ],
                          ),
                          Text(
                            'Total: ${_items.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          _buildPaginationControls(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDataSource extends DataGridSource {
  final List<DataGridRow> _dataGridRows;

  ItemDataSource(List<Tax> items)
      : _dataGridRows = items
      .map(
        (item) => DataGridRow(
      cells: [
        DataGridCell<String>(columnName: 'Label', value: item.label),
        DataGridCell<String>(
            columnName: 'Amount', value: item.amount),
        DataGridCell<String>(columnName: 'Type', value: item.type),
      ],
    ),
  )
      .toList();

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataCell) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            dataCell.value.toString(),
            style: const TextStyle(fontSize: 14.0),
          ),
        );
      }).toList(),
    );
  }
}

List<Widget> _buildActionButtonsWithSpacing() {
  return [
    _buildIconButton(Icons.refresh, Colors.orange),
    const SizedBox(width: 8.0),
    _buildIconButton(Icons.picture_as_pdf, AppColors.blackBorderColor),
    const SizedBox(width: 8.0),
    _buildIconButton(
        Icons.css_sharp, AppColors.whitePrimaryButton.withOpacity(0.8)),
    const SizedBox(width: 8.0),
    _buildIconButton(Icons.remove_red_eye_outlined, Colors.grey.shade200,
        borderColor: Colors.grey),
    const SizedBox(width: 8.0),
    _buildIconButton(Icons.edit, Colors.grey.shade200,
        borderColor: Colors.grey),
    const SizedBox(width: 8.0),
    _buildIconButton(Icons.delete_outline_sharp, Colors.grey.shade200,
        borderColor: Colors.grey),
    const SizedBox(width: 8.0),
    const CreateNewButton(),
  ];
}

Widget _buildIconButton(IconData icon, Color color, {Color? borderColor}) {
  return Container(
    height: 45,
    width: 45,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: color,
      border: borderColor != null ? Border.all(color: borderColor) : null,
    ),
    child: Icon(
      icon,
      size: 20,
      color: AppColors.simpleWhiteColor,
    ),
  );
}

Widget _buildPaginationControls() {
  return Row(
    children: [
      IconButton(
        icon: Icon(
          Icons.chevron_left,
          color: AppColors.buttonColor,
        ),
        onPressed: () {},
      ),
      const Text(
        "1 of 2",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.chevron_right,
          color: AppColors.buttonColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}
