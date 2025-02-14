// import 'package:flutter/material.dart';
//
// class ProductsTable extends StatefulWidget {
//   const ProductsTable({super.key});
//
//   @override
//   State<ProductsTable> createState() => _ProductsTableState();
// }
//
// class _ProductsTableState extends State<ProductsTable> {
//   int rowsPerPage = 10;
//   int currentPage = 1;
//   final List<Map<String, String>> data = List.generate(
//     50,
//         (index) => {
//       "Product": "Product $index",
//       "Barcode": "12345$index",
//       "Brand": "Brand $index",
//       "Category": "Category $index",
//       "SKU": "SKU-$index",
//       "Unit": "Unit $index",
//       "Supplier": "Supplier $index",
//       "Stock": "${index * 10}",
//       "Price": "${(index * 2.5).toStringAsFixed(2)}",
//       "Weight": "${index + 1}kg",
//       "Discount": "${index % 10}%",
//       "Tax": "${index % 5}%",
//       "Description": "Description for product $index",
//     },
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     final totalPages = (data.length / rowsPerPage).ceil();
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Products Table')),
//       body: Container(
//         margin: const EdgeInsets.all(16.0),
//         padding: const EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             // Add horizontal and vertical scrolling with constraints
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: ConstrainedBox(
//                   constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                   ),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Column(
//                       children: [
//                         _buildHeaderRow(),
//                         ..._buildTableRows(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             _buildPaginationControls(totalPages),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeaderRow() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         border: Border(
//           bottom: BorderSide(color: Colors.grey.shade300, width: 1),
//         ),
//       ),
//       child: Row(
//         children: [
//           _buildHeaderCell("Product"),
//           _buildHeaderCell("Barcode"),
//           _buildHeaderCell("Brand"),
//           _buildHeaderCell("Category"),
//           _buildHeaderCell("SKU"),
//           _buildHeaderCell("Unit"),
//           _buildHeaderCell("Supplier"),
//           _buildHeaderCell("Stock"),
//           _buildHeaderCell("Price"),
//           _buildHeaderCell("Weight"),
//           _buildHeaderCell("Discount"),
//           _buildHeaderCell("Tax"),
//           _buildHeaderCell("Description"),
//         ],
//       ),
//     );
//   }
//
//   List<Widget> _buildTableRows() {
//     final startIndex = (currentPage - 1) * rowsPerPage;
//     final endIndex = (startIndex + rowsPerPage).clamp(0, data.length);
//     final pageData = data.sublist(startIndex, endIndex);
//
//     return pageData.map((row) {
//       return Container(
//         decoration: BoxDecoration(
//           border: Border(
//             bottom: BorderSide(color: Colors.grey.shade300, width: 1),
//           ),
//         ),
//         child: Row(
//           children: [
//             _buildRowCell(row["Product"] ?? ""),
//             _buildRowCell(row["Barcode"] ?? ""),
//             _buildRowCell(row["Brand"] ?? ""),
//             _buildRowCell(row["Category"] ?? ""),
//             _buildRowCell(row["SKU"] ?? ""),
//             _buildRowCell(row["Unit"] ?? ""),
//             _buildRowCell(row["Supplier"] ?? ""),
//             _buildRowCell(row["Stock"] ?? ""),
//             _buildRowCell(row["Price"] ?? ""),
//             _buildRowCell(row["Weight"] ?? ""),
//             _buildRowCell(row["Discount"] ?? ""),
//             _buildRowCell(row["Tax"] ?? ""),
//             _buildRowCell(row["Description"] ?? ""),
//           ],
//         ),
//       );
//     }).toList();
//   }
//
//   Widget _buildHeaderCell(String title) {
//     return Container(
//       width: 120, // Fixed width for proper alignment
//       padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
//       decoration: BoxDecoration(
//         border: Border(
//           right: BorderSide(color: Colors.grey.shade300, width: 1),
//         ),
//       ),
//       child: Text(
//         title,
//         style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
//       ),
//     );
//   }
//
//   Widget _buildRowCell(String value) {
//     return Container(
//       width: 120, // Fixed width for proper alignment
//       padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//       decoration: BoxDecoration(
//         border: Border(
//           right: BorderSide(color: Colors.grey.shade300, width: 1),
//         ),
//       ),
//       child: Text(
//         value,
//         style: const TextStyle(color: Colors.black87),
//         textAlign: TextAlign.start,
//       ),
//     );
//   }
//
//   Widget _buildPaginationControls(int totalPages) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.first_page),
//               onPressed: currentPage > 1 ? () => setState(() => currentPage = 1) : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.chevron_left),
//               onPressed: currentPage > 1 ? () => setState(() => currentPage--) : null,
//             ),
//             Text(
//               "$currentPage",
//               style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
//             ),
//             IconButton(
//               icon: const Icon(Icons.chevron_right),
//               onPressed: currentPage < totalPages ? () => setState(() => currentPage++) : null,
//             ),
//             IconButton(
//               icon: const Icon(Icons.last_page),
//               onPressed: currentPage < totalPages ? () => setState(() => currentPage = totalPages) : null,
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             const Text("Rows per page:"),
//             const SizedBox(width: 8),
//             DropdownButton<int>(
//               value: rowsPerPage,
//               onChanged: (value) {
//                 if (value != null) {
//                   setState(() {
//                     rowsPerPage = value;
//                     currentPage = 1;
//                   });
//                 }
//               },
//               items: [5, 10, 20].map((e) {
//                 return DropdownMenuItem(
//                   value: e,
//                   child: Text("$e"),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../constants/colors.dart';
import '../constants/create_new_button.dart';
import 'custom_textform_field_withicon.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key});

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  late ProductDataSource _productDataSource;
  final TextEditingController emailController = TextEditingController();

  int _rowsPerPage = 5;
  final List<Map<String, String>> data = List.generate(
    20,
        (index) => {
      "Product": "Product $index",
      "Barcode": "12345$index",
      "Brand": "Brand $index",
      "Category": "Category $index",
      "SKU": "SKU-$index",
      "Unit": "Unit $index",
      "Supplier": "Supplier $index",
      "Stock": "${index * 10}",
      "Price": "${(index * 2.5).toStringAsFixed(2)}",
      "Weight": "${index + 1}kg",
      "Discount": "${index % 10}%",
      "Tax": "${index % 5}%",
      "Description": "Description for product $index",
      "Expiration Date": "2025-12-31",
      "Manufacturer": "Manufacturer $index",
      "Country of Origin": "Country $index",
      "Rating": "${(3.5 + index % 2).toStringAsFixed(1)}",
      "Reviews": "${index * 15}",
      "Warranty": "${index % 2 == 0 ? '1 year' : '2 years'}",
    },
  );

  int _currentPage = 1;
  int get _totalPages => (data.length / _rowsPerPage).ceil();

  @override
  void initState() {
    _productDataSource = ProductDataSource(data: data);
    super.initState();
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _onRowsPerPageChanged(int? newRowsPerPage) {
    if (newRowsPerPage != null) {
      setState(() {
        _rowsPerPage = newRowsPerPage;
        _currentPage = 1;
      });
    }
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
    final startRow = (_currentPage - 1) * _rowsPerPage;
    final endRow = (_currentPage * _rowsPerPage).clamp(0, data.length);
    final paginatedData = data.sublist(startRow, endRow);

    _productDataSource = ProductDataSource(data: paginatedData);

    return Column(
      children: [
        const SizedBox(height: 20,),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "Products",
              style: GoogleFonts.bricolageGrotesque(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.blackColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: isMobile ? MediaQuery.of(context).size.width * 0.6 : 300,
              child: CustomTextFormFieldWithIcon(
                hintText: "Search Products",
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
            child: SfDataGrid(
              source: _productDataSource,
              frozenColumnsCount: isMobile ? 0 : 2,
              horizontalScrollPhysics: const BouncingScrollPhysics(),
              columnWidthMode: ColumnWidthMode.auto,
              columns: _buildColumns(),
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
                          value: _rowsPerPage,
                          items: const [
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 20, child: Text("20")),
                          ],
                          onChanged: _onRowsPerPageChanged,
                        ),
                      ],
                    ),
                    // Pagination Controls
                    _buildPaginationControls(),
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
                          value: _rowsPerPage,
                          items: const [
                            DropdownMenuItem(value: 5, child: Text("5")),
                            DropdownMenuItem(value: 10, child: Text("10")),
                            DropdownMenuItem(value: 20, child: Text("20")),
                          ],
                          onChanged: _onRowsPerPageChanged,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    _buildPaginationControls(),
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
      'Product',
      'Barcode',
      'Brand',
      'Category',
      'SKU',
      'Unit',
      'Supplier',
      'Stock',
      'Price',
      'Weight',
      'Discount',
      'Tax',
      'Description',
      'Expiration Date',
      'Manufacturer',
      'Country of Origin',
      'Rating',
      'Reviews',
      'Warranty',
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

  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.first_page),
          onPressed: _currentPage > 1 ? () => _onPageChanged(1) : null,
        ),
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: _currentPage > 1 ? () => _onPageChanged(_currentPage - 1) : null,
        ),
        Text(
          '$_currentPage of $_totalPages',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: _currentPage < _totalPages ? () => _onPageChanged(_currentPage + 1) : null,
        ),
        IconButton(
          icon: const Icon(Icons.last_page),
          onPressed: _currentPage < _totalPages ? () => _onPageChanged(_totalPages) : null,
        ),
      ],
    );
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
      _buildIconButton(Icons.edit, Colors.grey.shade200, borderColor: Colors.grey),
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
}

class ProductDataSource extends DataGridSource {
  ProductDataSource({required List<Map<String, String>> data}) {
    _dataGridRows = data
        .map<DataGridRow>(
          (row) => DataGridRow(
        cells: row.entries
            .map(
              (entry) => DataGridCell<String>(
            columnName: entry.key,
            value: entry.value,
          ),
        )
            .toList(),
      ),
    )
        .toList();
  }

  List<DataGridRow> _dataGridRows = [];

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
    );
  }
}



List<Widget> _buildActionButtonsWithSpacing() {
  return [
    _buildIconButton(Icons.refresh, Colors.orange),
    const SizedBox(width: 8.0), // Spacing between buttons
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
