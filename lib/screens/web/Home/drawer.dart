import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellio/constants/colors.dart';

class MyDrawer extends StatelessWidget {
  final Function(int) onSelectItem;
  final int selectedIndex;
  const MyDrawer({super.key, required this.onSelectItem, required this.selectedIndex});

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
                offset: const Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.all(6),
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(6),
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





























