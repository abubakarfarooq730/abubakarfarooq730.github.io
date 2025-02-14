import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/customTextFormField.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/customerGenderDropdown.dart';

class AddExpenseDialogue extends StatefulWidget {
  const AddExpenseDialogue({super.key});
  @override
  _AddExpenseDialogueState createState() => _AddExpenseDialogueState();
}

class _AddExpenseDialogueState extends State<AddExpenseDialogue> {
  final TextEditingController expenseDateController = TextEditingController();
  final TextEditingController expenseAmountController = TextEditingController();
  final TextEditingController expenseNoteController = TextEditingController();

  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "New Expense",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const Divider(thickness: 1, color: Colors.grey),
              const SizedBox(height: 16),
              CustomTextField(
                controller: expenseDateController,
                labelText: "Expense Date",
              ),
              const SizedBox(height: 16),
              CustomDropdown(
                labelText: "Expense Category",
                items: ["Loading", "Tea", "Loader","Photocopies"],
                selectedValue: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: expenseAmountController,
                labelText: "Amount (Rs.)",
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: expenseNoteController,
                labelText: "Note",
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(8),
                      child: Center(
                        child:  Text(
                          "Cancel",
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
