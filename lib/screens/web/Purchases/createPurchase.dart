import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../constants/customTextFormField.dart';
import '../../../provider/purchaseProvider.dart';
import '../../../utils/customerGenderDropdown.dart';
import 'addExtraAmountDialogue.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/utils/indicatorHeadings.dart';

class AddPurchaseScreen extends StatefulWidget {
  const AddPurchaseScreen({super.key});

  @override
  State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
}

class _AddPurchaseScreenState extends State<AddPurchaseScreen> {

  DateTime? selectedDate;

  // TODO PRODUCT DIALOG BOX
  void productDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        DateTime? selectedDate;
        TextEditingController quantityController = TextEditingController();
        TextEditingController rateController = TextEditingController();
        double total = 0.0;

        return StatefulBuilder(
          builder: (context, setState) {
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
                  children: [
                    /// Title Row
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Title Details",
                            style: GoogleFonts.bricolageGrotesque(
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Stock Information
                    Container(
                      height: 70,
                      width: double.infinity,
                      color: AppColors.whiteForgotPassword.withOpacity(0.2),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Stock Information",
                            style: GoogleFonts.bricolageGrotesque(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1.0,
                              color: AppColors.whiteForgotPassword,
                            ),
                          ),
                          Text(
                            "Available: 0 Kilogram",
                            style: GoogleFonts.bricolageGrotesque(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Item Unit Row (Editable)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Item Unit",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                focusColor: AppColors.buttonColor,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Kilogram(kg)",
                                hintStyle: TextStyle(
                                  color: AppColors.blackColor.withOpacity(0.2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Item Quantity
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Item Quantity", style: GoogleFonts.bricolageGrotesque()),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: quantityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixText: "kg",
                                hintText: "1",
                                hintStyle: TextStyle(color: AppColors.blackColor),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  double quantity = double.tryParse(value) ?? 0;
                                  double rate = double.tryParse(rateController.text) ?? 0;
                                  total = quantity * rate;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Expiry Date
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Expiry", style: GoogleFonts.bricolageGrotesque()),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: selectedDate != null
                                    ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                                    : "",
                              ),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today, color: AppColors.blackColor),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );

                                if (pickedDate != null) {
                                  setState(() {
                                    selectedDate = pickedDate;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Rates
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rates", style: GoogleFonts.bricolageGrotesque()),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: rateController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Purchase Rate",
                                hintStyle: TextStyle(color: AppColors.blackColor),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  double quantity = double.tryParse(quantityController.text) ?? 0;
                                  double rate = double.tryParse(value) ?? 0;
                                  total = quantity * rate;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Total
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: GoogleFonts.bricolageGrotesque(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                            "Rs $total",
                            style: GoogleFonts.bricolageGrotesque(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),
                    const SizedBox(height: 10),

                    /// Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Cancel", style: GoogleFonts.bricolageGrotesque(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 25),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context, {
                              "quantity": quantityController.text,
                              "rate": rateController.text,
                              "total": total,
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Continue", style: GoogleFonts.bricolageGrotesque(fontSize: 16, color: AppColors.simpleWhiteColor, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // TODO PURCHASE DISCOUNT DIALOG BOX
  void purchaseDiscountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        String typeDropDown = 'Percentage';

        TextEditingController labelController = TextEditingController();
        TextEditingController amountController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
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
                  children: [
                    /// Title Row
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Purchase Discount",
                            style: GoogleFonts.bricolageGrotesque(
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Label",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              readOnly: false,
                              controller: labelController,
                              decoration: InputDecoration(
                                focusColor: AppColors.buttonColor,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Label",
                                hintStyle: TextStyle(
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: CustomDropdown(
                              labelText: "Type",
                              items: ["Percentage", "Amount"],
                              selectedValue: typeDropDown,
                              onChanged: (value) {
                                typeDropDown = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),



                    /// Amount
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount", style: GoogleFonts.bricolageGrotesque()),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "amount",
                                hintStyle: TextStyle(color: AppColors.blackColor),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(),
                    const SizedBox(height: 10),

                    /// Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Cancel", style: GoogleFonts.bricolageGrotesque(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 25),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Continue", style: GoogleFonts.bricolageGrotesque(fontSize: 16, color: AppColors.simpleWhiteColor, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // TODO PURCHASE TAX DIALOG BOX
  void purchaseTaxDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        String typeTaxDropDown = 'Percentage';
        String typeTaxExistingDropdown = 'VAT @ 15%';

        TextEditingController labelTaxController = TextEditingController();
        TextEditingController amountTaxController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setState) {
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
                  children: [
                    /// Title Row
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Purchase Tax",
                            style: GoogleFonts.bricolageGrotesque(
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Label",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              readOnly: false,
                              controller: labelTaxController,
                              decoration: InputDecoration(
                                focusColor: AppColors.buttonColor,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "Label",
                                hintStyle: TextStyle(
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Type",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: CustomDropdown(
                              labelText: "Type",
                              items: ["Percentage", "Amount"],
                              selectedValue: typeTaxDropDown,
                              onChanged: (value) {
                                typeTaxDropDown = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),



                    /// Amount
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Amount", style: GoogleFonts.bricolageGrotesque()),
                          SizedBox(
                            width: 600,
                            child: TextFormField(
                              controller: amountTaxController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.blackColor.withOpacity(0.2),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: "amount",
                                hintStyle: TextStyle(color: AppColors.blackColor),
                              ),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 410,
                            child: const Divider()),
                        const SizedBox(width: 20,),
                        Text("OR", style: GoogleFonts.bricolageGrotesque()),
                        const SizedBox(width: 20,),
                        SizedBox(
                          width: 410,
                            child: const Divider()),
                      ],
                    ),
                    const SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Existing Tax",
                            style: GoogleFonts.bricolageGrotesque(),
                          ),
                          SizedBox(
                            width: 600,
                            child: CustomDropdown(
                              labelText: "Existing Tax",
                              items: ["VAT @ 15%", "Tax of Cargo10%"],
                              selectedValue: typeTaxExistingDropdown,
                              onChanged: (value) {
                                typeTaxExistingDropdown = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Cancel", style: GoogleFonts.bricolageGrotesque(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 25),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("Continue", style: GoogleFonts.bricolageGrotesque(fontSize: 16, color: AppColors.simpleWhiteColor, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.webPartBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.webPartBackgroundColor,
        title: Text(
          'Add New Purchase',
          style: GoogleFonts.bricolageGrotesque(),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IndicatorHeading('Basic Information'),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: purchaseProvider.purchaseNoController,
                      labelText: "Purchase No *",
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseProvider.purchaseDateController,
                            labelText: "Purchase Date *",
                            readOnly: true,
                            onTap: () => purchaseProvider.selectDate(context,
                                purchaseProvider.purchaseDateController),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseProvider.dueDateController,
                            labelText: "Due Date",
                            readOnly: true,
                            onTap: () => purchaseProvider.selectDate(
                                context, purchaseProvider.dueDateController),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomTextField(
                            controller: purchaseProvider.expiryDateController,
                            labelText: "Expiry Date*",
                            readOnly: true,
                            onTap: () => purchaseProvider.selectDate(
                                context, purchaseProvider.expiryDateController),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Warehouse*",
                            items: ["CocaCola", "Peak freaks", "Engro"],
                            selectedValue: purchaseProvider.selectedWarehouse,
                            onChanged: (value) {
                              purchaseProvider.selectedWarehouse = value;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomDropdown(
                            labelText: "Supplier*",
                            items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
                            selectedValue: purchaseProvider.selectedSupplier,
                            onChanged: (value) {
                              purchaseProvider.selectedSupplier = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Line Items',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      onTap: () {
                        productDialogBox();
                      },
                      controller: TextEditingController(),
                      labelText: 'Add product',
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Line Item'),
                    const SizedBox(height: 26),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenWidth < 600 ? 600 : screenWidth,
                        child: DataTable(
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => AppColors.appColor),
                          columns: [
                            DataColumn(
                                label: Text(
                              'Product',
                              style: GoogleFonts.bricolageGrotesque(
                                  color: Colors.white),
                            )),
                            DataColumn(
                              label: Text(
                                'Quantity',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Unit Price',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Sub Total',
                                style: GoogleFonts.bricolageGrotesque(
                                    color: Colors.white),
                              ),
                            ),
                          ],
                          rows: [],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    IndicatorHeading('Billing'),
                    const SizedBox(height: 16),
                    screenWidth < 600
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBillingRow("Sub Totals", "Rs 0.0"),
                              const SizedBox(height: 4),
                              _buildEditableRow("Discount", "Rs. 20"),
                              const SizedBox(height: 4),
                              _buildEditableRow("Tax", "Rs. 200"),
                              const SizedBox(height: 4),
                              _buildBillingRow("Grand Total", "Rs 0.0"),
                              const SizedBox(height: 16),
                              _buildDropdownField("Payment Method", "Cash"),
                              const SizedBox(height: 16),
                              _buildInputField("Amount Payed",
                                  purchaseProvider.amountPayedController),
                              const SizedBox(height: 16),
                              _buildBillingRow("Balance Due", "Rs 0.0"),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller:
                                    purchaseProvider.purchaseNoteController,
                                maxLines: 2,
                                labelText: 'Purchase Note',
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AddExtraAmount();
                                      },
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Add Extra Charges",
                                        style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: _buildActionButton(
                                      "Save & Print",
                                      Icons.print,
                                      Colors.green,
                                      () {},
                                      context,
                                    ),
                                  ),
                                  screenWidth >= 600
                                      ? const SizedBox(width: 16)
                                      : const SizedBox(
                                          width: 5,
                                        ),
                                  Flexible(
                                    child: _buildActionButton(
                                      "Save",
                                      Icons.save,
                                      Colors.blue.shade700,
                                      () {},
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomTextField(
                                  controller:
                                      purchaseProvider.purchaseNoteController,
                                  maxLines: 2,
                                  labelText: 'Purchase Note',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildBillingRow("Sub Totals", "Rs 0.0"),
                                    const SizedBox(height: 4),
                                    _buildEditableRow("Discount", "Rs. 20"),
                                    const SizedBox(height: 4),
                                    _buildEditableRow("Tax", "Rs. 200"),
                                    const SizedBox(height: 4),
                                    _buildBillingRow("Grand Total", "Rs 0.0"),
                                    const SizedBox(height: 16),
                                    _buildDropdownField(
                                        "Payment Method", "Cash"),
                                    const SizedBox(height: 16),
                                    _buildInputField("Amount Payed",
                                        purchaseProvider.amountPayedController),
                                    const SizedBox(height: 16),
                                    _buildBillingRow("Balance Due", "Rs 0.0"),
                                    const SizedBox(height: 16),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AddExtraAmount();
                                            },
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Add Extra Charges",
                                              style: GoogleFonts
                                                  .bricolageGrotesque(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: _buildActionButton(
                                            "Save & Print",
                                            Icons.print,
                                            Colors.green,
                                            () {},
                                            context,
                                          ),
                                        ),
                                        screenWidth >= 600
                                            ? const SizedBox(width: 16)
                                            : const SizedBox(
                                                width: 5,
                                              ),
                                        Flexible(
                                          child: _buildActionButton(
                                            "Save",
                                            Icons.save,
                                            Colors.blue.shade700,
                                            () {},
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBillingRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.bricolageGrotesque(fontSize: 16),
        ),
        Text(
          value,
          style: GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildEditableRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.bricolageGrotesque(),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              onPressed: () {
                if(label == 'Discount') {
                  purchaseDiscountDialog();
                } else if(label == 'Tax') {
                  purchaseTaxDialog();
                }

              },
              icon: const Icon(Icons.edit, size: 16),
            ),
          ],
        ),
        Text(price),
      ],
    );
  }

  Widget _buildDropdownField(String label, String initialValue) {
    return CustomDropdown(
      labelText: label,
      items: ["Cash", "Check", "Debit/Credit Card", "Bank Transfer", "Due"],
      selectedValue: initialValue,
      onChanged: (value) {
        // Handle dropdown change
      },
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return CustomTextField(controller: controller, labelText: label);
  }

  Widget _buildActionButton(String label, IconData icon, Color color,
      Function onTap, BuildContext context) {
    double iconSize = MediaQuery.of(context).size.height * 0.022;
    double fontSize = MediaQuery.of(context).size.height * 0.015;
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.015,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: iconSize),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Text(
              label,
              style: GoogleFonts.bricolageGrotesque(
                fontSize: fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import '../../../constants/customTextFormField.dart';
// import '../../../provider/purchaseProvider.dart';
// import '../../../utils/customerGenderDropdown.dart';
// import 'addExtraAmountDialogue.dart';
// import 'package:sellio/constants/colors.dart';
// import 'package:sellio/utils/indicatorHeadings.dart';
//
// class AddPurchaseScreen extends StatefulWidget {
//   const AddPurchaseScreen({super.key});
//
//   @override
//   State<AddPurchaseScreen> createState() => _AddPurchaseScreenState();
// }
//
// class _AddPurchaseScreenState extends State<AddPurchaseScreen> {
//   DateTime? selectedDate;
//
//   void productDialogBox() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         DateTime? selectedDate;
//         TextEditingController quantityController = TextEditingController();
//         TextEditingController rateController = TextEditingController();
//         double total = 0.0;
//
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               insetPadding: const EdgeInsets.all(16),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   maxWidth: 600,
//                   maxHeight: MediaQuery.of(context).size.height * 0.9,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         LayoutBuilder(
//                           builder: (context, constraints) {
//                             bool isMobile = constraints.maxWidth < 600;
//                             return Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Title Details",
//                                           style: GoogleFonts.bricolageGrotesque(
//                                               fontWeight: FontWeight.bold)),
//                                       IconButton(
//                                         icon: Icon(Icons.close,
//                                             color: AppColors.blackColor),
//                                         onPressed: () => Navigator.pop(context),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(vertical: 8),
//                                   decoration: BoxDecoration(
//                                     color: AppColors.whiteForgotPassword.withOpacity(0.2),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Text("Stock Information",
//                                           style: GoogleFonts.bricolageGrotesque(
//                                               fontWeight: FontWeight.bold, fontSize: 16)),
//                                       Text("Available: 0 Kilogram",
//                                           style: GoogleFonts.bricolageGrotesque()),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 16),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Item Unit",
//                                   TextFormField(
//                                     readOnly: true,
//                                     decoration: _inputDecoration("Kilogram(kg)"),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Item Quantity",
//                                   TextFormField(
//                                     controller: quantityController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: _inputDecoration("1").copyWith(
//                                         suffixText: "kg"),
//                                     onChanged: (value) => _updateTotal(
//                                         value, rateController.text, setState),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Expiry",
//                                   TextFormField(
//                                     readOnly: true,
//                                     controller: TextEditingController(
//                                       text: selectedDate?.toString().split(' ')[0] ?? "",
//                                     ),
//                                     decoration: _inputDecoration("Select Date").copyWith(
//                                       suffixIcon: Icon(Icons.calendar_today,
//                                           color: AppColors.blackColor),
//                                     ),
//                                     onTap: () async {
//                                       final pickedDate = await showDatePicker(
//                                         context: context,
//                                         initialDate: DateTime.now(),
//                                         firstDate: DateTime(2000),
//                                         lastDate: DateTime(2100),
//                                       );
//                                       if (pickedDate != null) {
//                                         setState(() => selectedDate = pickedDate);
//                                       }
//                                     },
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Rates",
//                                   TextFormField(
//                                     controller: rateController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: _inputDecoration("Purchase Rate"),
//                                     onChanged: (value) => _updateTotal(
//                                         quantityController.text, value, setState),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text("Total",
//                                           style: GoogleFonts.bricolageGrotesque(
//                                               fontWeight: FontWeight.bold)),
//                                       Text("Rs $total",
//                                           style: GoogleFonts.bricolageGrotesque(
//                                               fontWeight: FontWeight.bold)),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 16),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       _dialogButton("Cancel", Colors.grey.shade100,
//                                               () => Navigator.pop(context)),
//                                       const SizedBox(width: 8),
//                                       _dialogButton("Continue", AppColors.buttonColor,
//                                               () {
//                                             Navigator.pop(context, {
//                                               "quantity": quantityController.text,
//                                               "rate": rateController.text,
//                                               "total": total,
//                                             });
//                                           }),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildDialogRow(bool isMobile, String label, Widget field) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: isMobile
//           ? Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: GoogleFonts.bricolageGrotesque()),
//           const SizedBox(height: 4),
//           field,
//         ],
//       )
//           : Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(width: 100,
//               child: Text(label, style: GoogleFonts.bricolageGrotesque())),
//           const SizedBox(width: 16),
//           Expanded(child: field),
//         ],
//       ),
//     );
//   }
//
//   InputDecoration _inputDecoration(String hint) {
//     return InputDecoration(
//       border: OutlineInputBorder(
//         borderSide: BorderSide(
//             color: AppColors.blackColor.withOpacity(0.2),
//             width: 0.5),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       hintText: hint,
//       hintStyle: TextStyle(
//           color: AppColors.blackColor.withOpacity(0.2)),
//     );
//   }
//
//   void _updateTotal(String quantity, String rate, Function setState) {
//     setState(() {
//       double qty = double.tryParse(quantity) ?? 0;
//       double rt = double.tryParse(rate) ?? 0;
//       // total = qty * rt;
//     });
//   }
//
//   Widget _dialogButton(String text, Color color, Function onPressed) {
//     return Container(
//       height: 40,
//       width: 100,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         onTap: () => onPressed(),
//         child: Text(text,
//             style: GoogleFonts.bricolageGrotesque(
//                 fontWeight: FontWeight.bold,
//                 color: color == AppColors.buttonColor
//                     ? Colors.white
//                     : Colors.black)),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final purchaseProvider = Provider.of<PurchaseProvider>(context);
//
//     return Scaffold(
//       backgroundColor: AppColors.webPartBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.webPartBackgroundColor,
//         title: Text('Add New Purchase',
//             style: GoogleFonts.bricolageGrotesque()),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isMobile = constraints.maxWidth < 600;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               color: Colors.white,
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     IndicatorHeading('Basic Information'),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                       controller: purchaseProvider.purchaseNoController,
//                       labelText: "Purchase No *",
//                     ),
//                     const SizedBox(height: 16),
//                     isMobile
//                         ? Column(
//                       children: [
//                         _buildDateField(
//                             purchaseProvider.purchaseDateController,
//                             "Purchase Date *"),
//                         const SizedBox(height: 16),
//                         _buildDateField(
//                             purchaseProvider.dueDateController,
//                             "Due Date"),
//                         const SizedBox(height: 16),
//                         _buildDateField(
//                             purchaseProvider.expiryDateController,
//                             "Expiry Date*"),
//                       ],
//                     )
//                         : Row(
//                       children: [
//                         Expanded(child: _buildDateField(
//                             purchaseProvider.purchaseDateController,
//                             "Purchase Date *")),
//                         const SizedBox(width: 16),
//                         Expanded(child: _buildDateField(
//                             purchaseProvider.dueDateController,
//                             "Due Date")),
//                         const SizedBox(width: 16),
//                         Expanded(child: _buildDateField(
//                             purchaseProvider.expiryDateController,
//                             "Expiry Date*")),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     isMobile
//                         ? Column(
//                       children: [
//                         CustomDropdown(
//                           labelText: "Warehouse*",
//                           items: ["CocaCola", "Peak freaks", "Engro"],
//                           selectedValue: purchaseProvider.selectedWarehouse,
//                           onChanged: (value) {
//                             purchaseProvider.selectedWarehouse = value;
//                           },
//                         ),
//                         const SizedBox(height: 16),
//                         CustomDropdown(
//                           labelText: "Supplier*",
//                           items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
//                           selectedValue: purchaseProvider.selectedSupplier,
//                           onChanged: (value) {
//                             purchaseProvider.selectedSupplier = value;
//                           },
//                         ),
//                       ],
//                     )
//                         : Row(
//                       children: [
//                         Expanded(
//                           child: CustomDropdown(
//                             labelText: "Warehouse*",
//                             items: ["CocaCola", "Peak freaks", "Engro"],
//                             selectedValue: purchaseProvider.selectedWarehouse,
//                             onChanged: (value) {
//                               purchaseProvider.selectedWarehouse = value;
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: CustomDropdown(
//                             labelText: "Supplier*",
//                             items: ["Saeed", "Nadeem", "Riaz", "Jawad"],
//                             selectedValue: purchaseProvider.selectedSupplier,
//                             onChanged: (value) {
//                               purchaseProvider.selectedSupplier = value;
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     IndicatorHeading('Line Items'),
//                     const SizedBox(height: 16),
//                     CustomTextField(
//                       onTap: productDialogBox,
//                       controller: TextEditingController(),
//                       labelText: 'Add product',
//                     ),
//                     const SizedBox(height: 16),
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: ConstrainedBox(
//                         constraints: BoxConstraints(
//                           minWidth: isMobile ? 600 : constraints.maxWidth,
//                         ),
//                         child: DataTable(
//                           headingRowColor: MaterialStateProperty.resolveWith(
//                                   (states) => AppColors.appColor),
//                           columns: [
//                             DataColumn(label: Text('Product',
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     color: Colors.white))),
//                             DataColumn(label: Text('Quantity',
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     color: Colors.white))),
//                             DataColumn(label: Text('Unit Price',
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     color: Colors.white))),
//                             DataColumn(label: Text('Sub Total',
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     color: Colors.white))),
//                           ],
//                           rows: [],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     IndicatorHeading('Billing'),
//                     const SizedBox(height: 16),
//                     isMobile
//                         ? Column(
//                       children: [
//                         _buildBillingSection(context, purchaseProvider),
//                         const SizedBox(height: 24),
//                         _buildActionButtons(context, isMobile),
//                       ],
//                     )
//                         : Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 2,
//                           child: CustomTextField(
//                             controller: purchaseProvider.purchaseNoteController,
//                             maxLines: 2,
//                             labelText: 'Purchase Note',
//                           ),
//                         ),
//                         const SizedBox(width: 24),
//                         Expanded(
//                           flex: 2,
//                           child: Column(
//                             children: [
//                               _buildBillingSection(context, purchaseProvider),
//                               const SizedBox(height: 24),
//                               _buildActionButtons(context, isMobile),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildDateField(TextEditingController controller, String label) {
//     return CustomTextField(
//       controller: controller,
//       labelText: label,
//       readOnly: true,
//       onTap: () => Provider.of<PurchaseProvider>(context, listen: false)
//           .selectDate(context, controller),
//     );
//   }
//
//   Widget _buildBillingSection(BuildContext context, PurchaseProvider provider) {
//     return Column(
//       children: [
//         _buildBillingRow("Sub Totals", "Rs 0.0"),
//         _buildEditableRow("Discount", "Rs. 20"),
//         _buildEditableRow("Tax", "Rs. 200"),
//         _buildBillingRow("Grand Total", "Rs 0.0"),
//         const SizedBox(height: 16),
//         CustomDropdown(
//           labelText: "Payment Method",
//           items: ["Cash", "Check", "Debit/Credit Card", "Bank Transfer", "Due"],
//           selectedValue: "Cash",
//           onChanged: (value) {},
//         ),
//         const SizedBox(height: 16),
//         CustomTextField(
//           controller: provider.amountPayedController,
//           labelText: "Amount Payed",
//         ),
//         const SizedBox(height: 16),
//         _buildBillingRow("Balance Due", "Rs 0.0"),
//         const SizedBox(height: 16),
//         _buildExtraChargesButton(),
//       ],
//     );
//   }
//
//   Widget _buildExtraChargesButton() {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade300,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: InkWell(
//         onTap: () => showDialog(
//           context: context,
//           builder: (context) => AddExtraAmount(),
//         ),
//         child: Center(
//           child: Text(
//             "Add Extra Charges",
//             style: GoogleFonts.bricolageGrotesque(
//                 color: Colors.grey,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildActionButtons(BuildContext context, bool isMobile) {
//     return Wrap(
//       spacing: 16,
//       runSpacing: 16,
//       alignment: WrapAlignment.end,
//       children: [
//         _buildActionButton(
//           "Save & Print",
//           Icons.print,
//           Colors.green,
//               () {},
//           isMobile ? double.infinity : null,
//         ),
//         _buildActionButton(
//           "Save",
//           Icons.save,
//           Colors.blue.shade700,
//               () {},
//           isMobile ? double.infinity : null,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildActionButton(String label, IconData icon, Color color,
//       Function onTap, [double? width]) {
//     return Container(
//       width: width,
//       child: ElevatedButton.icon(
//         icon: Icon(icon, size: 20),
//         label: Text(label),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//         ),
//         onPressed: () => onTap(),
//       ),
//     );
//   }
//
//   Widget _buildBillingRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: GoogleFonts.bricolageGrotesque(fontSize: 16)),
//           Text(value,
//               style: GoogleFonts.bricolageGrotesque(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEditableRow(String label, String price) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               Text(label, style: GoogleFonts.bricolageGrotesque()),
//               const SizedBox(width: 8),
//               IconButton(
//                 icon: Icon(Icons.edit, size: 16),
//                 onPressed: () {
//                   if (label == 'Discount') purchaseDiscountDialog();
//                   if (label == 'Tax') purchaseTaxDialog();
//                 },
//               ),
//             ],
//           ),
//           Text(price),
//         ],
//       ),
//     );
//   }
//
//   void purchaseDiscountDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String typeDropDown = 'Percentage';
//         TextEditingController labelController = TextEditingController();
//         TextEditingController amountController = TextEditingController();
//
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               insetPadding: const EdgeInsets.all(16),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   maxWidth: 600,
//                   maxHeight: MediaQuery.of(context).size.height * 0.8,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Purchase Discount",
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     fontWeight: FontWeight.bold)),
//                             IconButton(
//                               icon: Icon(Icons.close,
//                                   color: AppColors.blackColor),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                           ],
//                         ),
//                         const Divider(),
//                         LayoutBuilder(
//                           builder: (context, constraints) {
//                             bool isMobile = constraints.maxWidth < 600;
//                             return Column(
//                               children: [
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Label",
//                                   TextFormField(
//                                     controller: labelController,
//                                     decoration: _inputDecoration("Label"),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Type",
//                                   CustomDropdown(
//                                     labelText: "Type",
//                                     items: ["Percentage", "Amount"],
//                                     selectedValue: typeDropDown,
//                                     onChanged: (value) => setState(
//                                             () => typeDropDown = value.toString()),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Amount",
//                                   TextFormField(
//                                     controller: amountController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: _inputDecoration("Amount"),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 16),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       _dialogButton("Cancel", Colors.grey.shade100,
//                                               () => Navigator.pop(context)),
//                                       const SizedBox(width: 8),
//                                       _dialogButton("Continue", AppColors.buttonColor,
//                                               () {}),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void purchaseTaxDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String typeTaxDropDown = 'Percentage';
//         String typeTaxExistingDropdown = 'VAT @ 15%';
//         TextEditingController labelTaxController = TextEditingController();
//         TextEditingController amountTaxController = TextEditingController();
//
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               insetPadding: const EdgeInsets.all(16),
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(
//                   maxWidth: 600,
//                   maxHeight: MediaQuery.of(context).size.height * 0.8,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Purchase Tax",
//                                 style: GoogleFonts.bricolageGrotesque(
//                                     fontWeight: FontWeight.bold)),
//                             IconButton(
//                               icon: Icon(Icons.close,
//                                   color: AppColors.blackColor),
//                               onPressed: () => Navigator.pop(context),
//                             ),
//                           ],
//                         ),
//                         const Divider(),
//                         LayoutBuilder(
//                           builder: (context, constraints) {
//                             bool isMobile = constraints.maxWidth < 600;
//                             return Column(
//                               children: [
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Label",
//                                   TextFormField(
//                                     controller: labelTaxController,
//                                     decoration: _inputDecoration("Label"),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Type",
//                                   CustomDropdown(
//                                     labelText: "Type",
//                                     items: ["Percentage", "Amount"],
//                                     selectedValue: typeTaxDropDown,
//                                     onChanged: (value) => setState(
//                                             () => typeTaxDropDown = value.toString()),
//                                   ),
//                                 ),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Amount",
//                                   TextFormField(
//                                     controller: amountTaxController,
//                                     keyboardType: TextInputType.number,
//                                     decoration: _inputDecoration("Amount"),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 16),
//                                 Row(
//                                   children: [
//                                     Expanded(child: const Divider()),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 8.0),
//                                       child: Text("OR",
//                                           style: GoogleFonts.bricolageGrotesque()),
//                                     ),
//                                     Expanded(child: const Divider()),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 16),
//                                 _buildDialogRow(
//                                   isMobile,
//                                   "Existing Tax",
//                                   CustomDropdown(
//                                     labelText: "Existing Tax",
//                                     items: ["VAT @ 15%", "Tax of Cargo10%"],
//                                     selectedValue: typeTaxExistingDropdown,
//                                     onChanged: (value) => setState(
//                                             () => typeTaxExistingDropdown = value.toString()),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 16),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       _dialogButton("Cancel", Colors.grey.shade100,
//                                               () => Navigator.pop(context)),
//                                       const SizedBox(width: 8),
//                                       _dialogButton("Continue", AppColors.buttonColor,
//                                               () {}),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
