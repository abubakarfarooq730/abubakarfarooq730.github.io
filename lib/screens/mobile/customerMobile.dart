import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerMobileScreen extends StatefulWidget {
  @override
  State<CustomerMobileScreen> createState() => _CustomerMobileScreenState();
}

class _CustomerMobileScreenState extends State<CustomerMobileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth =  screenWidth * 0.42;
    double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(top: 20, left: containerWidth * 0.12),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  buildDashboardCardMobile(Icons.person_add_alt_1, "Active Customer", "7", Colors.blue, containerWidth),
                  buildDashboardCardMobile(Icons.person_remove, "Deleted Customer", "14", Colors.red, containerWidth),
                  buildDashboardCardMobile(Icons.access_time_sharp, "Receivable (Dues)", "Rs 30000.0", CupertinoColors.systemYellow, containerWidth),
                  buildDashboardCardMobile(Icons.access_time_sharp, "Payable Balance", "Rs 2233.0", CupertinoColors.systemGreen, containerWidth),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardCardMobile(
      IconData icon, String title, String amount, Color color, double width)
  {

    return Container(
      height: MediaQuery.of(context).size.height / 4,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 10),

                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child:
                                  Icon(icon, color: Colors.white, size: 23),
                                ),
                              ),
                            ),
                          Text(
                            amount,
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            title,
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }


}