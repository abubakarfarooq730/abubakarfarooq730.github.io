import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:universal_html/html.dart' as html;

import 'sales_return_report_mobileScreen.dart';


class SalesReturnReportWebScreen extends StatefulWidget {
  const SalesReturnReportWebScreen({super.key});

  @override
  State<SalesReturnReportWebScreen> createState() =>
      _SalesReturnReportWebScreenState();
}

class _SalesReturnReportWebScreenState extends State<SalesReturnReportWebScreen> {
  late SalesReturnReportDataSource _salesReturnReportDataSource;
  final Set<int> _highlightedRows = {};

  @override
  void initState() {
    super.initState();
    _salesReturnReportDataSource = SalesReturnReportDataSource(
        getCustomerReportData(), _highlightedRows, toggleHighlight);
  }

  List<SalesReturnReport> getCustomerReportData() {
    return [
      SalesReturnReport(
          1,'20/2/2012','Saeed', 2, 500, 200, ),
      SalesReturnReport(
        2,  '20/2/2012','Naeem',2,4000, 400, ),
      SalesReturnReport(
        3,'20/2/2012', 'Jawad', 2,3000, 300, ),
      SalesReturnReport(
        4, '20/2/2012','Shafique',2,2000, 200,),
    ];
  }

  void toggleHighlight(int saleNumber) {
    setState(() {
      if (_highlightedRows.contains(saleNumber)) {
        _highlightedRows.remove(saleNumber);
      } else {
        _highlightedRows.add(saleNumber);
      }
    });
  }

  Future<void> generateAndDownloadPDF() async {
    int totalSale = getCustomerReportData().length;
    double totalBalance = getCustomerReportData()
        .fold(0, (sum, report) => sum + report.grandTotal);
    double totalPay =
        getCustomerReportData().fold(0, (sum, report) => sum + report.grandTotal);
    double totalRemaining = getCustomerReportData()
        .fold(0, (sum, report) => sum - report.grandTotal);

    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
      'Sales Return Report',
      PdfStandardFont(PdfFontFamily.helvetica, 20),
    );

    page.graphics.drawString(
      'Statistics:',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTWH(0, 30, 500, 30),
    );
    page.graphics.drawString(
      'Sales Count: $totalSale',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 60, 500, 30),
    );
    page.graphics.drawString(
      'Total Balance: \$${totalBalance.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 80, 500, 30),
    );
    page.graphics.drawString(
      'Total Received: \$${totalRemaining.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 120, 500, 30),
    );
    page.graphics.drawString(
      'Total Remaining: \$${totalRemaining.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 120, 500, 30),
    );
    PdfGrid pdfGrid = PdfGrid();
    pdfGrid.columns.add(count: 5);
    pdfGrid.headers.add(1);

    // Add table headers
    PdfGridRow header = pdfGrid.headers[0];
    List<String> columnNames = [
      'Reference #',
      'Date',
      'Supplier',
      'Item',
      'Grand Total',
      'Received',
    ];
    for (int i = 0; i < columnNames.length; i++) {
      header.cells[i].value = columnNames[i];
    }

    // Add table rows for customer report
    for (var report in getCustomerReportData()) {
      PdfGridRow row = pdfGrid.rows.add();
      row.cells[0].value = report.referenceNumber.toString();
      row.cells[1].value = report.date;;
      row.cells[2].value = report.supplier;
      row.cells[3].value = report.items;
      row.cells[4].value = report.received.toString();
    }

    pdfGrid.draw(page: page, bounds: const Rect.fromLTWH(0, 150, 500, 600));

    List<int> bytes = await document.save();
    document.dispose();

    if (kIsWeb) {
      // ✅ Web: Download file
      final blob = html.Blob([Uint8List.fromList(bytes)]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "SalesReport.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // ✅ Mobile/Desktop: Save and share file
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/SalesReport.pdf';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      if (Platform.isAndroid || Platform.isIOS) {
        await Share.shareXFiles([XFile(filePath)], text: 'Sales Report');
      }
    }
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return SizedBox(
      width: 200,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: GoogleFonts.unna(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: GoogleFonts.unna(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.simpleWhiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: generateAndDownloadPDF,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sales Return Report:',
              style:
                  GoogleFonts.unna(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Sales Count', '4', Colors.blueAccent),
                _buildStatCard('Total Balance', '20000', Colors.orange),
                _buildStatCard('Total Received', '15000', Colors.green),
                _buildStatCard('Total Remaining', '5000', Colors.red),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SfDataGrid(
                source: _salesReturnReportDataSource,
                columns: [
                  _buildGridColumn('Reference #', 'salesNumber'),
                  _buildGridColumn('Date', 'date'),
                  _buildGridColumn('Supplier', 'supplier'),
                  _buildGridColumn('Items', 'items'),
                  _buildGridColumn('Grand Total', 'grandTotal'),
                  _buildGridColumn('Received', 'received'),
                ],
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                columnWidthMode: ColumnWidthMode.fill,
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
        color: Colors.blueAccent,
        child: Text(label,
            style: GoogleFonts.unna(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}

class SalesReturnReportDataSource extends DataGridSource {
  final List<SalesReturnReport> reports;
  final Set<int> highlightedRows;
  final Function(int) toggleHighlight;
  List<DataGridRow> _dataGridRows = [];

  SalesReturnReportDataSource(
      this.reports, this.highlightedRows, this.toggleHighlight) {
    _dataGridRows = reports.map((report) {
      return DataGridRow(cells: [
        DataGridCell<int>(
            columnName: 'salesNumber', value: report.referenceNumber),
        DataGridCell<String>(
            columnName: 'date', value: report.date),
        DataGridCell<String>(columnName: 'supplier', value: report.supplier),
        DataGridCell<int>(columnName: 'item', value: report.items),
        DataGridCell<double>(columnName: 'grandTotal', value: report.grandTotal),
        DataGridCell<double>(columnName: 'remaining', value: report.received),

      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int purchaseNumber = row.getCells()[0].value;

    return DataGridRowAdapter(
      color: highlightedRows.contains(purchaseNumber)
          ? Colors.yellow.withOpacity(0.3)
          : Colors.transparent,
      cells: row.getCells().map((cell) {
        return GestureDetector(
          onTap: () => toggleHighlight(purchaseNumber),
          child: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: Text(cell.value.toString(), style: GoogleFonts.unna()),
          ),
        );
      }).toList(),
    );
  }
}
