import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../constants/colors.dart';
import '../../../models/customer_statement_model.dart';

class CustomerStatementMobileScreen extends StatefulWidget {
  const CustomerStatementMobileScreen({super.key});

  @override
  State<CustomerStatementMobileScreen> createState() =>
      _CustomerStatementMobileScreenState();
}

class _CustomerStatementMobileScreenState
    extends State<CustomerStatementMobileScreen> {
  String? selectedUser;
  List<String> users = ['User 1', 'User 2', 'User 3', 'User 4'];
  List<DataGridRow> _dataGridRows = [];
  bool _isLoading = false;

  Future<void> _updateTable(String user) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await Future.delayed(const Duration(seconds: 1));
      List<CustomerStatement> fetchedData = _mockDatabaseData(user);
      setState(() {
        _dataGridRows = fetchedData.map((statement) {
          return DataGridRow(cells: [
            DataGridCell<String>(columnName: 'Date', value: statement.date),
            DataGridCell<double>(columnName: 'Total', value: statement.total),
            DataGridCell<double>(
                columnName: 'Invoice Due', value: statement.invoiceDue),
            DataGridCell<double>(
                columnName: 'Receiving', value: statement.receiving),
            DataGridCell<double>(
                columnName: 'Balance', value: statement.balance),
          ]);
        }).toList();
      });
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<CustomerStatement> _mockDatabaseData(String user) {
    if (user == 'User 1') {
      return [
        CustomerStatement(
          date: '01/01/2024',
          total: 200.00,
          invoiceDue: 50.00,
          receiving: 150.00,
          balance: 0.00,
        ),
      ];
    } else if (user == 'User 2') {
      return [
        CustomerStatement(
          date: '02/01/2024',
          total: 300.00,
          invoiceDue: 100.00,
          receiving: 200.00,
          balance: 50.00,
        ),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.simpleWhiteColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.blackColor,
          ),
        ),
        title: const Text("Customer Statement"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Select Customer",
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: AppColors.buttonColor,
                      value: selectedUser,
                      hint: const Text("Select User",
                          style: TextStyle(color: Colors.white)),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.white),
                      items: users.map((String user) {
                        return DropdownMenuItem<String>(
                          value: user,
                          child: Text(user,
                              style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedUser = newValue;
                          });
                          _updateTable(newValue);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SfDataGrid(
                    source: _CustomerStatementDataSource(_dataGridRows),
                    columns: [
                      _buildGridColumn('Date'),
                      _buildGridColumn('Total'),
                      _buildGridColumn('Invoice Due'),
                      _buildGridColumn('Receiving'),
                      _buildGridColumn('Balance'),
                    ],
                    columnWidthMode: ColumnWidthMode.fill,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridColumn _buildGridColumn(String title) {
    return GridColumn(
      columnName: title,
      label: Container(
        padding: const EdgeInsets.all(10),
        color: AppColors.buttonColor,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _CustomerStatementDataSource extends DataGridSource {
  _CustomerStatementDataSource(this._rows);

  List<DataGridRow> _rows = [];

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((dataGridCell) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300),
              right: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          child: Text(
            dataGridCell.value.toString(),
            style: const TextStyle(fontSize: 14),
          ),
        );
      }).toList(),
    );
  }
}
