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

import '../../../models/customer_report_model.dart';

class CustomerReportWebScreen extends StatefulWidget {
  const CustomerReportWebScreen({super.key});

  @override
  State<CustomerReportWebScreen> createState() =>
      _CustomerReportWebScreenState();
}

class _CustomerReportWebScreenState extends State<CustomerReportWebScreen> {
  late CustomerReportDataSource _customerReportDataSource;
  final Set<int> _highlightedRows = {};

  @override
  void initState() {
    super.initState();
    _customerReportDataSource = CustomerReportDataSource(
        getCustomerReportData(), _highlightedRows, toggleHighlight);
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
        getCustomerReportData().fold(0, (sum, report) => sum + report.paid);
    double totalRemaining = getCustomerReportData()
        .fold(0, (sum, report) => sum + report.remaining);

    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
      'Customer Report',
      PdfStandardFont(PdfFontFamily.helvetica, 20),
    );

    page.graphics.drawString(
      'Statistics:',
      PdfStandardFont(PdfFontFamily.helvetica, 14),
      bounds: const Rect.fromLTWH(0, 30, 500, 30),
    );
    page.graphics.drawString(
      'Total Sale: $totalSale',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 60, 500, 30),
    );
    page.graphics.drawString(
      'Total Balance: \$${totalBalance.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 80, 500, 30),
    );
    page.graphics.drawString(
      'Total Pay: \$${totalPay.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 100, 500, 30),
    );
    page.graphics.drawString(
      'Total Remaining: \$${totalRemaining.toStringAsFixed(2)}',
      PdfStandardFont(PdfFontFamily.helvetica, 12),
      bounds: const Rect.fromLTWH(0, 120, 500, 30),
    );

    // Create PDF grid (table) for customer report data
    PdfGrid pdfGrid = PdfGrid();
    pdfGrid.columns.add(count: 10);
    pdfGrid.headers.add(1);

    // Add table headers
    PdfGridRow header = pdfGrid.headers[0];
    List<String> columnNames = [
      'Sale #',
      'Date',
      'Item',
      'Subtotal',
      'Discount',
      'Tax',
      'Extra',
      'Grand Total',
      'Paid',
      'Remaining'
    ];
    for (int i = 0; i < columnNames.length; i++) {
      header.cells[i].value = columnNames[i];
    }

    // Add table rows for customer report
    for (var report in getCustomerReportData()) {
      PdfGridRow row = pdfGrid.rows.add();
      row.cells[0].value = report.saleNumber.toString();
      row.cells[1].value = report.date;
      row.cells[2].value = report.item;
      row.cells[3].value = report.subtotal.toString();
      row.cells[4].value = report.discount.toString();
      row.cells[5].value = report.tax.toString();
      row.cells[6].value = report.extraAmount.toString();
      row.cells[7].value = report.grandTotal.toString();
      row.cells[8].value = report.paid.toString();
      row.cells[9].value = report.remaining.toString();
    }

    pdfGrid.draw(page: page, bounds: const Rect.fromLTWH(0, 150, 500, 600));

    List<int> bytes = await document.save();
    document.dispose();

    if (kIsWeb) {
      // ✅ Web: Download file
      final blob = html.Blob([Uint8List.fromList(bytes)]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "CustomerReport.pdf")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      // ✅ Mobile/Desktop: Save and share file
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/CustomerReport.pdf';
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      if (Platform.isAndroid || Platform.isIOS) {
        await Share.shareXFiles([XFile(filePath)], text: 'Customer Report');
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
              'Customer Report:',
              style:
                  GoogleFonts.unna(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('Total Sale', '4', Colors.blueAccent),
                _buildStatCard('Total Balance', '20000', Colors.green),
                _buildStatCard('Total Pay', '15000', Colors.orange),
                _buildStatCard('Total Remaining', '5000', Colors.red),
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
                  _buildGridColumn('Extra', 'extraAmount'),
                  _buildGridColumn('Grand Total', 'grandTotal'),
                  _buildGridColumn('Paid', 'paid'),
                  _buildGridColumn('Remaining', 'remaining'),
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

class CustomerReportDataSource extends DataGridSource {
  final List<CustomerReport> reports;
  final Set<int> highlightedRows;
  final Function(int) toggleHighlight;
  List<DataGridRow> _dataGridRows = [];

  CustomerReportDataSource(
      this.reports, this.highlightedRows, this.toggleHighlight) {
    _dataGridRows = reports.map((report) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'saleNumber', value: report.saleNumber),
        DataGridCell<String>(columnName: 'date', value: report.date),
        DataGridCell<String>(columnName: 'item', value: report.item),
        DataGridCell<double>(columnName: 'subtotal', value: report.subtotal),
        DataGridCell<double>(columnName: 'discount', value: report.discount),
        DataGridCell<double>(columnName: 'tax', value: report.tax),
        DataGridCell<double>(
            columnName: 'extraAmount', value: report.extraAmount),
        DataGridCell<double>(
            columnName: 'grandTotal', value: report.grandTotal),
        DataGridCell<double>(columnName: 'paid', value: report.paid),
        DataGridCell<double>(columnName: 'remaining', value: report.remaining),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    final int saleNumber = row.getCells()[0].value;

    return DataGridRowAdapter(
      color: highlightedRows.contains(saleNumber)
          ? Colors.yellow.withOpacity(0.3)
          : Colors.transparent,
      cells: row.getCells().map((cell) {
        return GestureDetector(
          onTap: () => toggleHighlight(saleNumber),
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
