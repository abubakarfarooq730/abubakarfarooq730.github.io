import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/constants/colors.dart';

class AddExtraAmount extends StatefulWidget {
  const AddExtraAmount({super.key});

  @override
  State<AddExtraAmount> createState() => _AddExtraAmountState();
}

class _AddExtraAmountState extends State<AddExtraAmount> {
  final TextEditingController addExtraAmountController = TextEditingController();
  final TextEditingController addExtraAmountLabelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Add Extra Amount",
                style: GoogleFonts.bricolageGrotesque(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.black45,
              thickness: 0.3,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: addExtraAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Extra Amount",
                labelStyle: GoogleFonts.bricolageGrotesque(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Text Field for Tax Label
            TextFormField(
              controller: addExtraAmountLabelController,
              decoration: InputDecoration(
                labelText: "Extra Amount Label",
                labelStyle: GoogleFonts.bricolageGrotesque(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Cancel Button
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
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
                // Continue Button
                InkWell(
                  onTap: () {
                    // Add your continue logic here
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 110,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
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
    );
  }
}
