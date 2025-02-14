import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../constants/colors.dart';

class CustomerReportMobileScreen extends StatefulWidget {
  const CustomerReportMobileScreen({super.key});

  @override
  State<CustomerReportMobileScreen> createState() =>
      _CustomerReportMobileScreenState();
}

class _CustomerReportMobileScreenState extends State<CustomerReportMobileScreen> {
  late CustomerReportDataSource _customerReportDataSource;

  @override
  void initState() {
    super.initState();
    _customerReportDataSource =
        CustomerReportDataSource(getCustomerReportData());
  }

  List<CustomerReport> getCustomerReportData() {
    return [
      CustomerReport(
          1, '2024-02-06', 'Item A', 5000, 500, 200, 100, 5400, 3000, 2400),
      CustomerReport(
          2, '2024-02-07', 'Item B', 4000, 400, 150, 80, 4230, 2500, 1730),
      CustomerReport(
          3, '2024-02-08', 'Item C', 3000, 300, 100, 50, 3150, 2000, 1150),
      CustomerReport(
          4, '2024-02-09', 'Item D', 2000, 200, 50, 20, 2070, 1000, 1070),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Report',
          style: GoogleFonts.unna(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Report:',
                style: GoogleFonts.unna(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Sale\n4', textAlign: TextAlign.center),
                Text('Total Balance\n20000', textAlign: TextAlign.center),
                Text('Total Pay\n15000', textAlign: TextAlign.center),
                Text('Total Remaining\n5000', textAlign: TextAlign.center),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SfDataGrid(
                source: _customerReportDataSource,
                columns: [
                  _buildGridColumn('Sale #', 'saleNumber'),
                  _buildGridColumn('Date', 'date'),
                  _buildGridColumn('Item', 'item'),
                  _buildGridColumn('Subtotal', 'subtotal'),
                  _buildGridColumn('Discount', 'discount'),
                  _buildGridColumn('Tax', 'tax'),
                  _buildGridColumn('Extra Amount', 'extraAmount'),
                  _buildGridColumn('Grand Total', 'grandTotal'),
                  _buildGridColumn('Paid', 'paid'),
                  _buildGridColumn('Remaining', 'remaining'),
                ],
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                headerRowHeight: 40,
                rowHeight: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridColumn _buildGridColumn(String label, String columnName) {
    return GridColumn(
      columnName: columnName,
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        color: AppColors.buttonColor,
        child: Text(
          label,
          style: GoogleFonts.unna(
              fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class CustomerReport {
  final int saleNumber;
  final String date;
  final String item;
  final double subtotal;
  final double discount;
  final double tax;
  final double extraAmount;
  final double grandTotal;
  final double paid;
  final double remaining;

  CustomerReport(
      this.saleNumber,
      this.date,
      this.item,
      this.subtotal,
      this.discount,
      this.tax,
      this.extraAmount,
      this.grandTotal,
      this.paid,
      this.remaining);
}

class CustomerReportDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  CustomerReportDataSource(List<CustomerReport> reports) {
    _dataGridRows = reports
        .map((report) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'saleNumber', value: report.saleNumber),
              DataGridCell<String>(columnName: 'date', value: report.date),
              DataGridCell<String>(columnName: 'item', value: report.item),
              DataGridCell<double>(
                  columnName: 'subtotal', value: report.subtotal),
              DataGridCell<double>(
                  columnName: 'discount', value: report.discount),
              DataGridCell<double>(columnName: 'tax', value: report.tax),
              DataGridCell<double>(
                  columnName: 'extraAmount', value: report.extraAmount),
              DataGridCell<double>(
                  columnName: 'grandTotal', value: report.grandTotal),
              DataGridCell<double>(columnName: 'paid', value: report.paid),
              DataGridCell<double>(
                  columnName: 'remaining', value: report.remaining),
            ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map((cell) {
      return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(cell.value.toString()),
      );
    }).toList());
  }
}
