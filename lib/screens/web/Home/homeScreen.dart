import 'package:flutter/material.dart';
import 'package:sellio/screens/Items/brand/brands.dart';
import 'package:sellio/screens/Items/category/categories.dart';
import 'package:sellio/screens/Items/discount/discount.dart';
import 'package:sellio/screens/Items/products.dart';
import 'package:sellio/screens/Items/tax/taxes.dart';
import 'package:sellio/screens/Items/units/units.dart';
import 'package:sellio/screens/Return/salesReturn.dart';
import 'package:sellio/screens/cornStore.dart';
import 'package:sellio/screens/customer.dart';
import 'package:sellio/screens/dashboard.dart';
import 'package:sellio/screens/purchases.dart';
import 'package:sellio/screens/staff/employeeScreen.dart';
import 'package:sellio/screens/staff/roles.dart';
import 'package:sellio/screens/suppliers.dart';
import '../../Return/purchaseReturn.dart';
import '../../Sales/quotations.dart';
import '../../cylinders/cylinderStock.dart';
import '../../cylinders/cylinders.dart';
import '../../cylinders/emptyCylinders.dart';
import '../../Sales/sales.dart';
import '../../expenses/expenses.dart';
import '../../expenses/expensesCategories.dart';
import '../../inventory.dart';
import '../../reports.dart';
import '../../settings.dart';
import '../../warehouse.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isDrawerOpen = false;
  final List<Widget> _screens = [
    const DashboardScreen(),
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
    setState(() {
      _selectedIndex = index;
      if (MediaQuery.of(context).size.width < 600) {
        _isDrawerOpen = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 600)
            MyDrawer(onSelectItem: _onSelectItem, selectedIndex: _selectedIndex),
          if (MediaQuery.of(context).size.width < 600 && _isDrawerOpen)
            MyDrawer(onSelectItem: _onSelectItem, selectedIndex: _selectedIndex),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16.0), // Adjusted padding
                  child: Row(
                    children: [
                      if (MediaQuery.of(context).size.width < 600)
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              _isDrawerOpen = !_isDrawerOpen; // Toggle drawer state
                            });
                          },
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _screens,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}