import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../provider/employeeProvider.dart';
import '../constants/colors.dart';
import '../constants/create_new_button.dart';
import '../screens/web/staff/Employee/addEmployeeScreen.dart';
import 'custom_textform_field_withicon.dart';

class EmployeeTable extends StatefulWidget {
  const EmployeeTable({super.key});

  @override
  State<EmployeeTable> createState() => _EmployeeTableState();
}

class _EmployeeTableState extends State<EmployeeTable> {
  late ProductDataSource _productDataSource;
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
    employeeProvider.fetchEmployees(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildTable(context, isMobile: true),
      tablet: (context) => _buildTable(context, isMobile: false),
      desktop: (context) => _buildTable(context, isMobile: false),
    );
  }

  Widget _buildTable(BuildContext context, {required bool isMobile}) {
    final employeeProvider = Provider.of<EmployeeProvider>(context, listen: true);
    final startRow = (employeeProvider.currentPage - 1) * employeeProvider.rowsPerPage;
    final endRow = (employeeProvider.currentPage * employeeProvider.rowsPerPage).clamp(0, employeeProvider.employees.length);
    final paginatedData = employeeProvider.employees.sublist(startRow, endRow);

    _productDataSource = ProductDataSource(data: paginatedData, employeeProvider: employeeProvider);

    return Column(
      children: [
        const SizedBox(height: 20),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Employee",
              style: GoogleFonts.bricolageGrotesque(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.blackColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: isMobile ? MediaQuery.of(context).size.width * 0.6 : 300,
              child: CustomTextFormFieldWithIcon(
                hintText: "Search Employee",
                leadingIcon: Icons.search,
                fillColor: AppColors.whiteBorderColor.withOpacity(0.2),
                borderColor: AppColors.whiteBorderColor,
                focusedBorderColor: AppColors.whitePrimaryButton,
                controller: emailController,
              ),
            ),
            ..._buildActionButtonsWithSpacing(employeeProvider),
          ],
        ),
        const SizedBox(height: 16.0),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            // Inside the _EmployeeTableState class, update the SfDataGrid widget
            child: SfDataGrid(
              source: _productDataSource,
              selectionMode: SelectionMode.single,
              horizontalScrollPhysics: const BouncingScrollPhysics(),
              frozenColumnsCount: 1,
              columnWidthMode: isMobile ? ColumnWidthMode.auto : ColumnWidthMode.fill,
              columns: _buildColumns(),
              onSelectionChanged: (List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
                if (addedRows.isNotEmpty) {
                  final selectedRow = addedRows.first;
                  final selectedEmail = selectedRow.getCells().firstWhere((cell) => cell.columnName == "Email").value;

                  if (employeeProvider.selectedEmployeeEmail == selectedEmail) {
                    employeeProvider.clearSelectedEmployee();
                  } else {
                    employeeProvider.setSelectedEmployee(selectedEmail);
                  }
                } else {
                  employeeProvider.clearSelectedEmployee();
                }
              },




            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isMobile)
                Row(
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
                          value: employeeProvider.rowsPerPage,
                          items: const [
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 20, child: Text("20")),
                          ],
                          onChanged: (newRowsPerPage) {
                            employeeProvider.setRowsPerPage(newRowsPerPage!);
                          },
                        ),
                      ],
                    ),
                    _buildPaginationControls(employeeProvider),
                  ],
                ),
              if (isMobile)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rows per page:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8.0),
                        DropdownButton<int>(
                          value: employeeProvider.rowsPerPage,
                          items: const [
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 20, child: Text("20")),
                          ],
                          onChanged: (newRowsPerPage) {
                            employeeProvider.setRowsPerPage(newRowsPerPage!);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    _buildPaginationControls(employeeProvider),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }

  List<GridColumn> _buildColumns() {
    return [
      "Name",
      "Email",
      "Role",
      "State",
    ].map((columnName) {
      return GridColumn(
        columnName: columnName,
        label: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            columnName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildPaginationControls(EmployeeProvider employeeProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.first_page),
          onPressed: employeeProvider.currentPage > 1
              ? () => employeeProvider.setCurrentPage(1)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: employeeProvider.currentPage > 1
              ? () => employeeProvider.setCurrentPage(employeeProvider.currentPage - 1)
              : null,
        ),
        Text(
          '${employeeProvider.currentPage} of ${employeeProvider.totalPages}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: employeeProvider.currentPage < employeeProvider.totalPages
              ? () => employeeProvider.setCurrentPage(employeeProvider.currentPage + 1)
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.last_page),
          onPressed: employeeProvider.currentPage < employeeProvider.totalPages
              ? () => employeeProvider.setCurrentPage(employeeProvider.totalPages)
              : null,
        ),
      ],
    );
  }

  List<Widget> _buildActionButtonsWithSpacing(EmployeeProvider employeeProvider) {
    return [
      InkWell(
        onTap: () {
          final employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
          employeeProvider.fetchEmployees(context);
        },
        child: _buildIconButton(Icons.refresh, Colors.orange),
      ),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.picture_as_pdf, AppColors.blackBorderColor, onTap: () {
        // Handle PDF export action
      }),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.css_sharp, AppColors.whitePrimaryButton.withOpacity(0.8), onTap: () {
        // Handle custom action
      }),
      const SizedBox(width: 8.0),
      _buildIconButton(
        Icons.remove_red_eye_outlined,
        employeeProvider.selectedEmployeeEmail != null ? AppColors.appColor : Colors.grey.shade200,
        borderColor: Colors.grey,
        isEnabled: employeeProvider.selectedEmployeeEmail != null,
        onTap: () {
          if (employeeProvider.selectedEmployeeEmail != null) {
            // Handle view action
          }
        },
      ),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.edit,
        employeeProvider.selectedEmployeeEmail != null ? AppColors.appColor : Colors.grey.shade200,
        borderColor: Colors.grey,
        isEnabled: employeeProvider.selectedEmployeeEmail != null,
        onTap: () {
          if (employeeProvider.selectedEmployeeEmail != null) {

          }
        },
      ),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.delete_outline_sharp,
        employeeProvider.selectedEmployeeEmail != null ? AppColors.appColor : Colors.grey.shade200,
        borderColor: Colors.grey,
        isEnabled: employeeProvider.selectedEmployeeEmail != null,
        onTap: () {
          if (employeeProvider.selectedEmployeeEmail != null) {
            // Handle delete action
          }
        },
      ),
      const SizedBox(width: 8.0),
      CreateNewButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AddEmployeeScreen();
            },
          );
        },
      ),
    ];
  }


  Widget _buildIconButton(IconData icon, Color color, {Color? borderColor, bool isEnabled = true, VoidCallback? onTap}) {
    return InkWell(
      onTap: isEnabled ? onTap : null,  // Disables tap when button is disabled
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isEnabled ? color : color.withOpacity(0.5),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.simpleWhiteColor,
        ),
      ),
    );
  }

}

class ProductDataSource extends DataGridSource {
  ProductDataSource({required List<Map<String, String>> data, required this.employeeProvider}) {
    _dataGridRows = data
        .map<DataGridRow>(
          (row) => DataGridRow(
        cells: [
          DataGridCell<String>(columnName: 'Name', value: row['Name'] ?? ''),
          DataGridCell<String>(columnName: 'Email', value: row['Email'] ?? ''),
          DataGridCell<String>(columnName: 'Role', value: row['Role'] ?? ''),
          DataGridCell<String>(columnName: 'State', value: row['isActive'] ?? ''),
        ],
      ),
    )
        .toList();
  }

  final EmployeeProvider employeeProvider;
  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final rowEmail = row.getCells().firstWhere((cell) => cell.columnName == "Email").value;
    bool isSelected = employeeProvider.selectedEmployeeEmail == rowEmail;


    return DataGridRowAdapter(
      color: isSelected ? AppColors.appColor : Colors.transparent,
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.bricolageGrotesque(
              color: isSelected ? AppColors.whiteBackground : Colors.black,
            ),
          ),
        );
      }).toList(),
    );
  }

}
