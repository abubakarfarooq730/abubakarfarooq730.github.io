import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../constants/colors.dart';

class PurchaseReportMobileScreen extends StatefulWidget {
  const PurchaseReportMobileScreen({super.key});

  @override
  State<PurchaseReportMobileScreen> createState() =>
      _PurchaseReportMobileScreenState();
}

class _PurchaseReportMobileScreenState extends State<PurchaseReportMobileScreen> {
  late PurchaseReportDataSource _purchaseReportDataSource;

  @override
  void initState() {
    super.initState();
    _purchaseReportDataSource =
        PurchaseReportDataSource(getCustomerReportData());
  }

  List<PurchaseReport> getCustomerReportData() {
    return [
      PurchaseReport(
          1,'20/2/2012','Saeed', 2, 500, 200, 100, 5400, 3000,200 ),
      PurchaseReport(
          2,  '20/2/2012','Naeem',2,4000, 400, 150, 80, 4230, 2500,),
      PurchaseReport(
          3,'20/2/2012', 'Jawad', 2,3000, 300, 100, 50, 3150, 2000,),
      PurchaseReport(
          4, '20/2/2012','Shafique',2,2000, 200, 50, 20, 2070, 1000,),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Purchase Report',
          style: GoogleFonts.unna(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Purchase Report:',
                style: GoogleFonts.unna(
                    fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),child: Center(child: Text('PUR Count\n4', textAlign: TextAlign.center,style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 13,
                ),))),
                Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),child: Center(child: Text('Balance\n20000', textAlign: TextAlign.center,style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 13,
                ),))),
                Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(5),
                    ),child: Center(child: Text('Total Pay\n15000', textAlign: TextAlign.center,style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 13,
                ),))),
                Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),child: Center(child: Text('Remaining\n5000', textAlign: TextAlign.center,style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 13,
                ),))),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SfDataGrid(
                source: _purchaseReportDataSource,
                columns: [
                  _buildGridColumn('Purchase #', 'purchaseNumber'),
                  _buildGridColumn('Date', 'date'),
                  _buildGridColumn('Supplier', 'supplier'),
                  _buildGridColumn('Items', 'items'),
                  _buildGridColumn('Subtotal', 'subtotal'),
                  _buildGridColumn('Discount', 'discount'),
                  _buildGridColumn('Tax', 'tax'),
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

class PurchaseReport {
  final int purchaseNumber;
  final String date;
  final String supplier;
  final int items;
  final double subtotal;
  final double discount;
  final double tax;
  final double grandTotal;
  final double paid;
  final double remaining;

  PurchaseReport(
      this.purchaseNumber,
      this.date,
      this.supplier,
      this.items,
      this.subtotal,
      this.discount,
      this.tax,
      this.grandTotal,
      this.paid,
      this.remaining,
      );
}

class PurchaseReportDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  PurchaseReportDataSource(List<PurchaseReport> reports) {
    _dataGridRows = reports
        .map((report) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'purchaseNumber', value: report.purchaseNumber),
      DataGridCell<String>(
          columnName: 'date', value: report.date),
              DataGridCell<String>(columnName: 'supplier', value: report.supplier),
      DataGridCell<int>(columnName: 'item', value: report.items),
              DataGridCell<double>(
                  columnName: 'subtotal', value: report.subtotal),
              DataGridCell<double>(
                  columnName: 'discount', value: report.discount),
              DataGridCell<double>(columnName: 'tax', value: report.tax),
              DataGridCell<double>(
                  columnName: 'grandTotal', value: report.grandTotal),
              DataGridCell<double>(columnName: 'paid', value: report.paid),
      DataGridCell<double>(columnName: 'remaining', value: report.remaining),

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
