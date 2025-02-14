import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../constants/colors.dart';

class PurchaseReturnReportMobileScreen extends StatefulWidget {
  const PurchaseReturnReportMobileScreen({super.key});

  @override
  State<PurchaseReturnReportMobileScreen> createState() =>
      _PurchaseReturnReportMobileScreenState();
}

class _PurchaseReturnReportMobileScreenState extends State<PurchaseReturnReportMobileScreen> {
  late PurchaseReportDataSource _purchaseReportDataSource;

  @override
  void initState() {
    super.initState();
    _purchaseReportDataSource =
        PurchaseReportDataSource(getCustomerReportData());
  }

  List<PurchaseReturnReport> getCustomerReportData() {
    return [
      PurchaseReturnReport(
          1,'20/2/2012','Saeed', 2, 500, 200, ),
      PurchaseReturnReport(
          2,  '20/2/2012','Naeem',2,4000, 400,),
      PurchaseReturnReport(
          3,'20/2/2012', 'Jawad', 2,3000, 300,),
      PurchaseReturnReport(
          4, '20/2/2012','Shafique',2,2000, 200,),
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
                  _buildGridColumn('Reference #', 'referenceNumber'),
                  _buildGridColumn('Date', 'date'),
                  _buildGridColumn('Supplier', 'supplier'),
                  _buildGridColumn('Items', 'items'),
                  _buildGridColumn('Grand Total', 'grandTotal'),
                  _buildGridColumn('Received', 'received'),
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

class PurchaseReturnReport {
  final int referenceNumber;
  final String date;
  final String supplier;
  final int items;
  final double grandTotal;
  final double received;

  PurchaseReturnReport(
      this.referenceNumber,
      this.date,
      this.supplier,
      this.items,
      this.grandTotal,
      this.received,
      );
}

class PurchaseReportDataSource extends DataGridSource {
  List<DataGridRow> _dataGridRows = [];

  PurchaseReportDataSource(List<PurchaseReturnReport> reports) {
    _dataGridRows = reports
        .map((report) => DataGridRow(cells: [
              DataGridCell<int>(
                  columnName: 'purchaseNumber', value: report.referenceNumber),
      DataGridCell<String>(
          columnName: 'date', value: report.date),
              DataGridCell<String>(columnName: 'supplier', value: report.supplier),
      DataGridCell<int>(columnName: 'item', value: report.items),
      DataGridCell<double>(columnName: 'grandTotal', value: report.grandTotal),
      DataGridCell<double>(columnName: 'remaining', value: report.received),

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
