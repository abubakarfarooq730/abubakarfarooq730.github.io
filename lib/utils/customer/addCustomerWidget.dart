import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sellio/provider/customerProvider.dart';
import '../constants/cnicFormatter.dart';
import '../constants/customTextFormField.dart';
import '../utils/customerGenderDropdown.dart';
import '../constants/colors.dart';

class AddCustomerDialog extends StatefulWidget {
  const AddCustomerDialog({Key? key}) : super(key: key);

  @override
  State<AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<AddCustomerDialog> {
  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context, listen: false);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Add New Customer",
                  style: GoogleFonts.bricolageGrotesque(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Divider(
              color: Colors.black45,
              thickness: 0.3,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.nameController,
                            labelText: "Name",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.phoneNumberController,
                            labelText: "Phone Number",
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.cnicController,
                            labelText: "CNIC",
                            keyboardType: TextInputType.phone,
                            inputFormatters: [CNICInputFormatter()],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {},
                            tooltip: 'Scan CNIC',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown(
                      labelText: "Gender",
                      items: ["Male", "Female"],
                      selectedValue: customerProvider.selectedGender,
                      onChanged: (value) {
                        setState(() {
                          customerProvider.selectedGender = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.emailAddressController,
                            labelText: "Email",
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.addressController,
                            labelText: "Address",
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.cityController,
                            labelText: "City",
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.stateController,
                            labelText: "State",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.zipCodeController,
                            labelText: "Zip Code",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: customerProvider.countryController,
                            labelText: "Country",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: customerProvider.balancePayableController,
                      labelText: "Previous Balance Payable",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
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
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
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
                    onTap: ()=>
                      customerProvider.isLoading ? null : customerProvider.addCustomer(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Center(
                      child: customerProvider.isLoading ? CircularProgressIndicator(color: Colors.white,):Text(
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
