import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../constants/colors.dart';

class SalesReportMobileScreen extends StatefulWidget {
  const SalesReportMobileScreen({super.key});

  @override
  State<SalesReportMobileScreen> createState() =>
      _SalesReportMobileScreenState();
}

class _SalesReportMobileScreenState extends State<SalesReportMobileScreen> {
  late SalesReportDataSource _salesReportDataSource;

  @override
  void initState() {
    super.initState();
    _salesReportDataSource =
        SalesReportDataSource(getCustomerReportData());
  }

  List<SalesReport> getCustomerReportData() {
    return [
      SalesReport(
          1, 'Saeed', 5000, 500, 200, 100, 5400, 3000, ),
      SalesReport(
          2, 'Naeem', 4000, 400, 150, 80, 4230, 2500,),
      SalesReport(
          3, 'Jawad', 3000, 300, 100, 50, 3150, 2000,),
      SalesReport(
          4, 'Shafique',2000, 200, 50, 20, 2070, 1000,),
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
                Text('Sales Count\n4', textAlign: TextAlign.center),
                Text('Total Sales\n20000', textAlign: TextAlign.center),
                Text('Total Profit\n15000', textAlign: TextAlign.center),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SfDataGrid(
                source: _salesReportDataSource,
                columns: [
                  _buildGridColumn('Sale #', 'saleNumber'),
                  _buildGridColumn('Customer', 'customer'),
                  _buildGridColumn('Subtotal', 'subtotal'),
                  _buildGridColumn('Discount', 'discount'),
                  _buildGridColumn('Tax', 'tax'),
                  _buildGridColumn('Extra Amount', 'extraAmount'),
                  _buildGridColumn('Grand Total', 'grandTotal'),
                  _buildGridColumn('Profit', 'profit'),
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

class SalesReport {
  final int saleNumber;
  final String customer;
  final double subtotal;
  final double discount;
  final double tax;
  final double extraAmount;
  final double grandTotal;
  final double profit;

  SalesReport(
      this.saleNumber,
      this.customer,
      this.subtotal,
      this.discount,
      this.tax,
      this.extraAmount,
      this.grandTotal,
      this.profit,);
}

class SalesReportDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  SalesReportDataSource(List<SalesReport> reports) {
    _dataGridRows = reports
        .map((report) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'saleNumber', value: report.saleNumber),
              DataGridCell<String>(columnName: 'customer', value: report.customer),
              DataGridCell<double>(
                  columnName: 'subtotal', value: report.subtotal),
              DataGridCell<double>(
                  columnName: 'discount', value: report.discount),
              DataGridCell<double>(columnName: 'tax', value: report.tax),
              DataGridCell<double>(
                  columnName: 'extraAmount', value: report.extraAmount),
              DataGridCell<double>(
                  columnName: 'grandTotal', value: report.grandTotal),
              DataGridCell<double>(columnName: 'profit', value: report.profit),

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
