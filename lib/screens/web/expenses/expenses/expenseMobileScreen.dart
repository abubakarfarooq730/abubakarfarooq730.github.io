import 'package:flutter/material.dart';
import 'package:sellio/utils/expensesCategoryTable.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/create_new_button.dart';
import '../../../../utils/product_table.dart';

class ExpensesCategoryMobileScreen extends StatefulWidget {
  const ExpensesCategoryMobileScreen({super.key});

  @override
  State<ExpensesCategoryMobileScreen> createState() => _ExpensesCategoryMobileScreenState();
}

class _ExpensesCategoryMobileScreenState extends State<ExpensesCategoryMobileScreen> {
  final TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ExpensesCategoryTable();
  }


  List<Widget> _buildActionButtonsWithSpacing() {
    return [
      _buildIconButton(Icons.refresh, Colors.orange),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.picture_as_pdf, AppColors.blackBorderColor),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.css_sharp, AppColors.whitePrimaryButton.withOpacity(0.8)),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.remove_red_eye_outlined, Colors.grey.shade200,
          borderColor: Colors.grey),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.edit, Colors.grey.shade200, borderColor: Colors.grey),
      const SizedBox(width: 8.0),
      _buildIconButton(Icons.delete_outline_sharp, Colors.grey.shade200, borderColor: Colors.grey),
      const SizedBox(width: 8.0),
      CreateNewButton(
        onPressed: (){},
      ),
    ];
  }

  Widget _buildIconButton(IconData icon, Color color, {Color? borderColor}) {
    return Container(
      height: 45,
      width: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.simpleWhiteColor,
      ),
    );
  }


}
