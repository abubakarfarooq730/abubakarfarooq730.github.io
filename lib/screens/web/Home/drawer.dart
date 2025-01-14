import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellio/constants/colors.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onSelectItem; // Callback for item selection
  final int selectedIndex; // Currently selected index

  MyDrawer({required this.onSelectItem, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: const BoxDecoration(
        color: AppColors.whiteBackground,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _buildListTile(
                context,
                title: "Dashboard",
                icon: FontAwesomeIcons.dashboard,
                index: 0,
              ),
              _buildExpansionTile(
                context,
                title: "Staff",
                icon: Icons.supervised_user_circle_rounded,
                children: [
                  _buildListTile(
                    context,
                    title: "Employees",
                    icon: FontAwesomeIcons.users,
                    index: 1,
                  ),
                  _buildListTile(
                    context,
                    title: "Roles",
                    icon: Icons.work_outline,
                    index: 2,
                  ),
                ],
              ),
              _buildListTile(
                context,
                title: "Customer",
                icon: FontAwesomeIcons.user,
                index: 3,
              ),
              _buildExpansionTile(
                context,
                title: "Items",
                icon: FontAwesomeIcons.shop,
                children: [
                  _buildListTile(
                    context,
                    title: "Products",
                    icon: FontAwesomeIcons.cube,
                    index: 4,
                  ),
                  _buildListTile(
                    context,
                    title: "Categories",
                    icon: Icons.category,
                    index: 5,
                  ),
                  _buildListTile(
                    context,
                    title: "Brands",
                    icon: FontAwesomeIcons.brandsFontAwesome,
                    index: 6,
                  ),
                  _buildListTile(
                    context,
                    title: "Discounts",
                    icon: FontAwesomeIcons.percentage,
                    index: 7,
                  ),
                  _buildListTile(
                    context,
                    title: "Tax",
                    icon: FontAwesomeIcons.handPaper,
                    index: 8,
                  ),
                  _buildListTile(
                    context,
                    title: "Unit",
                    icon: FontAwesomeIcons.legal,
                    index: 9,
                  ),
                ],
              ),
              _buildListTile(
                context,
                title: "Suppliers",
                icon: FontAwesomeIcons.handshake,
                index: 10,
              ),
              _buildListTile(context,
                title: "Purchases",
                icon: FontAwesomeIcons.calculator,
                index: 11,
              ),
              _buildListTile(
                context,
                title: "Corn Store",
                icon: FontAwesomeIcons.store,
                index: 12,
              ),
              _buildExpansionTile(
                context,
                title: "Cylinder",
                icon: FontAwesomeIcons.cube,
                children: [
                  _buildListTile(
                    context,
                    title: "Empty Cylinder",
                    icon: FontAwesomeIcons.circleExclamation,
                    index: 13,
                  ),
                  _buildListTile(
                    context,
                    title: "Cylinder",
                    icon: FontAwesomeIcons.cubesStacked,
                    index: 14,
                  ),
                  _buildListTile(
                    context,
                    title: "Cylinder Stock",
                    icon: FontAwesomeIcons.warehouse,
                    index: 15,
                  ),
                ],
              ),
              _buildExpansionTile(
                context,
                title: "Sales",
                icon: Icons.point_of_sale_sharp,
                children: [
                  _buildListTile(
                    context,
                    title: "Sales",
                    icon: FontAwesomeIcons.cartShopping,
                    index: 16,
                  ),
                  _buildListTile(
                    context,
                    title: "Quotations",
                    icon: Icons.format_quote_outlined,
                    index: 17,
                  ),
                ],
              ),
              _buildExpansionTile(
                context,
                title: "Returns",
                icon: Icons.assignment_return_outlined,
                children: [
                  _buildListTile(
                    context,
                    title: "Sales Return",
                    icon: Icons.compare_arrows_outlined,
                    index: 18,
                  ),
                  _buildListTile(
                    context,
                    title: "Purchase Return",
                    icon: Icons.compare_arrows_outlined,
                    index: 19,
                  ),
                ],
              ),
              _buildExpansionTile(
                context,
                title: "Expenses",
                icon: Icons.attach_money_outlined,
                children: [
                  _buildListTile(
                    context,
                    title: "Expenses",
                    icon: FontAwesomeIcons.moneyBill,
                    index: 20,
                  ),
                  _buildListTile(
                    context,
                    title: "Categories",
                    icon: Icons.category,
                    index: 21,
                  ),
                ],
              ),
              _buildListTile(
                context,
                title: "Reports",
                icon: Icons.report,
                index: 22,
              ),
              _buildListTile(
                context,
                title: "Warehouses",
                icon: Icons.warehouse,
                index: 23,
              ),
              _buildListTile(
                context,
                title: "Inventory",
                icon: Icons.inventory,
                index: 24,
              ),
              _buildListTile(
                context,
                title: "Settings",
                icon: Icons.settings,
                index: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildListTile(BuildContext context, {
    required String title,
    required IconData icon,
    required int index,
  }) {
    bool isSelected = index == selectedIndex;
    return Container(
      color: isSelected ? AppColors.buttonColor : Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.bricolageGrotesque(
            color: isSelected ? AppColors.whiteBackground : AppColors.blackColor,
            fontSize: 17,
          ),
        ),
        leading: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteBackground,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(6),
          child: Icon(
            icon,
            color: isSelected ? AppColors.buttonColor : AppColors.blackColor,
            size: 20,
          ),
        ),
        onTap: () {
          onSelectItem(index);
        },
      ),
    );
  }

  Widget _buildExpansionTile(BuildContext context, {
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return ExpansionTile(
      title: Text(
        title,
        style: GoogleFonts.bricolageGrotesque(
          color: AppColors.blackColor,
          fontSize: 17,
        ),
      ),
      leading: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteBackground, // White background for the icon
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow positioning
            ),
          ],
        ),
        padding: EdgeInsets.all(6), // Adjust padding for better icon spacing
        child: Icon(
          icon,
          color: AppColors.blackColor,
          size: 20,
        ),
      ),
      children: children,
    );
  }
}
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Dashboard")), body: Center(child: Text("Dashboard Screen")));
  }
}

class EmployeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Employees")), body: Center(child: Text("Employees Screen")));
  }
}

class RolesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Roles")), body: Center(child : Text("Roles Screen")));
  }
}

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Customer")), body: Center(child: Text("Customer Screen")));
  }
}

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Products")), body: Center(child: Text("Products Screen")));
  }
}

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Categories")), body: Center(child: Text("Categories Screen")));
  }
}

class BrandsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Brands")), body: Center(child: Text("Brands Screen")));
  }
}

class DiscountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Discounts")), body: Center(child: Text("Discounts Screen")));
  }
}

class TaxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Tax")), body: Center(child: Text("Tax Screen")));
  }
}

class UnitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Unit")), body: Center(child: Text("Unit Screen")));
  }
}

class SuppliersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Suppliers")), body: Center(child: Text("Suppliers Screen")));
  }
}

class PurchasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Purchases")), body: Center(child: Text("Purchases Screen")));
  }
}

class CornStoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Corn Store")), body: Center(child: Text("Corn Store Screen")));
  }
}

class EmptyCylinderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Empty Cylinder")), body: Center(child: Text("Empty Cylinder Screen")));
  }
}

class CylinderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Cylinder")), body: Center(child: Text("Cylinder Screen")));
  }
}

class CylinderStockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Cylinder Stock")), body: Center(child: Text("Cylinder Stock Screen")));
  }
}

class SalesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Sales")), body: Center(child: Text("Sales Screen")));
  }
}

class QuotationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Quotations")), body: Center(child: Text("Quotations Screen")));
  }
}

class SalesReturnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Sales Return")), body: Center(child: Text("Sales Return Screen")));
  }
}

class PurchaseReturnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Purchase Return")), body: Center(child: Text("Purchase Return Screen")));
  }
}

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Expenses")), body: Center(child: Text("Expenses Screen")));
  }
}

class ExpenseCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Expense Categories")), body: Center(child: Text("Expense Categories Screen")));
  }
}

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Reports")), body: Center(child: Text("Reports Screen")));
  }
}

class WarehousesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Warehouses")), body: Center(child: Text ("Warehouses Screen")));
  }
}

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Inventory")), body: Center(child: Text("Inventory Screen")));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Settings")), body: Center(child: Text("Settings Screen")));
  }
}