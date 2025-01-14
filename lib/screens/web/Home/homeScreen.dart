import 'package:flutter/material.dart';

import 'drawer.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index

  // List of screens to display
  final List<Widget> _screens = [
    DashboardScreen(),
    EmployeesScreen(),
    RolesScreen(),
    CustomerScreen(),
    ProductsScreen(),
    CategoriesScreen(),
    BrandsScreen(),
    DiscountsScreen(),
    TaxScreen(),
    UnitScreen(),
    SuppliersScreen(),
    PurchasesScreen(),
    CornStoreScreen(),
    EmptyCylinderScreen(),
    CylinderScreen(),
    CylinderStockScreen(),
    SalesScreen(),
    QuotationsScreen(),
    SalesReturnScreen(),
    PurchaseReturnScreen(),
    ExpensesScreen(),
    ExpenseCategoriesScreen(),
    ReportsScreen(),
    WarehousesScreen(),
    InventoryScreen(),
    SettingsScreen(),
  ];

  void _onSelectItem(int index) {
    // Update the selected index based on the item tapped
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MyDrawer(onSelectItem: _onSelectItem, selectedIndex: _selectedIndex),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
          ),
        ],
      ),
    );
  }
}

