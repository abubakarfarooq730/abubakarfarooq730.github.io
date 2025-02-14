import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/barchartModel.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final List<String> texts = ['Sale # 1', 'Sale # 2', 'Sale # 3', 'Sale # 4', 'Sale # 5'];
  final List<String> texts1 = ['Rs 10.0', 'Rs 10.0', 'Rs 10.0', 'Rs 10.0', 'Rs 10.0'];

  final List<String> texts2 = ['Dewan', 'Ice', 'Gas', 'Wash', 'Powder'];
  final List<String> texts3 = ['2', '18 Cubes', '300 KG', '12 KG', '228 KG'];


  final List<BarChartModel> data = [
    BarChartModel(year: "12 AM", financial: 250),
    BarChartModel(year: "04 AM", financial: 300),
    BarChartModel(year: "08 AM", financial: 100),
    BarChartModel(year: "12 PM", financial: 450),
    BarChartModel(year: "04 PM", financial: 630),
    BarChartModel(year: "08 PM", financial: 950),
    BarChartModel(year: "12 AM", financial: 400),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth =
       screenWidth * 0.18;
    double screenHeight = MediaQuery.of(context).size.height;

    double chartWidth = screenWidth * 0.57;
    double saleWidth = screenWidth * 0.25;
    double customerWidth = screenWidth * 0.35;
    double saleWidthSmall = screenWidth * 0.22;
    double chartHeight =
        screenHeight * 0.5;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Dashboard",
                style: GoogleFonts.bricolageGrotesque(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: containerWidth * 0.12),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  // Use conditional rendering based on screen width
                  buildDashboardCardWeb(Icons.shopping_cart, "Sales",
                          "Rs 0.0", Colors.blue, containerWidth),
                  buildDashboardCardWeb(Icons.payment, "Payments",
                          "Rs 0.0", Colors.pinkAccent, containerWidth),
                  buildDashboardCardWeb(Icons.calculate, "Purchases",
                          "Rs 0.0", Colors.deepOrangeAccent, containerWidth),
                  buildDashboardCardWeb(Icons.money, "Expenses", "Rs 0.0",
                          Colors.red, containerWidth),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Chart Container with Dots and Labels inside it
                  Container(
                    width: chartWidth,
                    height: chartHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 70, left: 15, right: 15),
                          child: BarChart(
                            BarChartData(
                              barGroups: data.asMap().entries.map((entry) {
                                final index = entry.key;
                                final item = entry.value;
                                Color barColor;
                                String label;

                                // Assign color and label based on the index
                                switch (index % 4) {
                                  case 0:
                                    barColor = Colors.blue;
                                    label = 'Sales';
                                    break;
                                  case 1:
                                    barColor = Colors.red;
                                    label = 'Expenses';
                                    break;
                                  case 2:
                                    barColor = Colors.orange;
                                    label = 'Purchases';
                                    break;
                                  case 3:
                                    barColor = Colors.pink;
                                    label = 'Payments';
                                    break;
                                  default:
                                    barColor = Colors.blue;
                                    label = 'Sales';
                                }

                                return BarChartGroupData(
                                  x: index,
                                  barRods: [
                                    BarChartRodData(
                                      toY: item.financial.toDouble(),
                                      color: barColor,
                                      width: 18,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ],
                                );
                              }).toList(),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                    getTitlesWidget: (value, meta) {
                                      return Text(
                                        value.toInt().toString(),
                                        style: const TextStyle(fontSize: 12),
                                      );
                                    },
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();
                                      if (index >= 0 && index < data.length) {
                                        return Text(
                                          data[index].year,
                                          style: const TextStyle(fontSize: 12),
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                              ),
                              gridData: FlGridData(
                                show: true,
                                horizontalInterval: 100,
                                drawVerticalLine: false, // Hide vertical lines
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.black.withOpacity(0.1),
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              borderData: FlBorderData(show: false),
                            ),
                          ),
                        ),
                        // Dots and Labels positioned within the graph container
                        Positioned(
                          top: 20,
                          right: 10,
                          child: Row(
                            children: [
                              buildDotWithLabel(Colors.blue, "Sales"),
                              SizedBox(width: 12),
                              buildDotWithLabel(Colors.red, "Expenses"),
                              SizedBox(width: 12),
                              buildDotWithLabel(Colors.orange, "Purchases"),
                              SizedBox(width: 12),
                              buildDotWithLabel(Colors.pink, "Payments"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Column containing the three Dashboard Cards
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        buildDashboardCardWeb(
                            CupertinoIcons.arrow_up_right_circle,
                            "Dues Payable",
                            "Rs 0.0",
                            Colors.deepOrangeAccent,
                            containerWidth),
                        SizedBox(height: 20),
                        buildDashboardCardWeb(
                            CupertinoIcons.arrow_down_left_circle,
                            "Dues Receivable",
                            "Rs 0.0",
                            CupertinoColors.systemYellow,
                            containerWidth),
                        SizedBox(height: 20),
                        buildDashboardCardWeb(
                            Icons.trending_up_outlined,
                            "Profit",
                            "Rs 0.0",
                            CupertinoColors.systemGreen,
                            containerWidth),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
                    child: Container(
                      width: saleWidth,
                      height: chartHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children
                                children: [
                                  Text(
                                    "Recent Sales",
                                    style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Add navigation or action here
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "View All",
                                          style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black54,
                              thickness: 0.4,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: texts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height:30,
                                      width: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              texts[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 160,
                                            ),
                                            Text(
                                              texts1[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
                    child: Container(
                      width: saleWidth,
                      height: chartHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children
                                children: [
                                  Text(
                                    "Inventory",
                                    style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Add navigation or action here
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "View All",
                                          style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black54,
                              thickness: 0.4,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: texts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height:30,
                                      width: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              texts[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 160,
                                            ),
                                            Text(
                                              texts1[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
                    child: Container(
                      width: saleWidthSmall,
                      height: chartHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children
                                children: [
                                  Text(
                                    "Activity",
                                    style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Add navigation or action here
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "View All",
                                          style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black54,
                              thickness: 0.4,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: texts.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    SizedBox(
                                      height:30,
                                      width: 320,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              texts[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                            SizedBox(
                                              width: 160,
                                            ),
                                            Text(
                                              texts1[index],
                                              style: GoogleFonts.bricolageGrotesque(fontSize: 17, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
                    child: Container(
                      width: customerWidth,
                      height: chartHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children
                                children: [
                                  Text(
                                    "Top Selling Customer",
                                    style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Add navigation or action here
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "View All",
                                          style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black54,
                              thickness: 0.4,
                            ),
                            Center(child: Text('No Item Yet',style: GoogleFonts.bricolageGrotesque(
                            ),)),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: containerWidth * 0.14),
                    child: Container(
                      width: customerWidth,
                      height: chartHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes the position of the shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust as needed
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children
                                children: [
                                  Text(
                                    "Top Customers",
                                    style: GoogleFonts.bricolageGrotesque(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Add navigation or action here
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "View All",
                                          style: GoogleFonts.bricolageGrotesque(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.black54,
                              thickness: 0.4,
                            ),
                        Center(child: Text('No Item Yet',style: GoogleFonts.bricolageGrotesque(),),),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDashboardCardMobile(
      IconData icon, String title, String amount, Color color, double width) {
    bool isMobile = width < 600; // Check if the width is less than 600

    return Container(
      height: MediaQuery.of(context).size.height / 5,
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
                    if (!isMobile) // Only show the icon in the row if not mobile
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(icon, color: Colors.white, size: 23),
                          ),
                        ),
                      ),
                    if (!isMobile)
                      SizedBox(width: 40), // Add space only if not mobile
                    Expanded(
                      child: Column(
                        mainAxisAlignment: isMobile
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.start,
                        crossAxisAlignment: isMobile
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          if (isMobile) // Show the icon at the top left for mobile
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10,
                                  bottom: 10), // Reduced padding for mobile
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
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            title,
                            style: GoogleFonts.bricolageGrotesque(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
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
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                DateTime.now().toLocal().toString().split(' ')[0],
                style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDashboardCardWeb(
      IconData icon, String title, String amount, Color color, double width) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(icon, color: Colors.white, size: 23),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          amount,
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.bricolageGrotesque(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                DateTime.now().toLocal().toString().split(' ')[0],
                style: GoogleFonts.bricolageGrotesque(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDotWithLabel(Color color, String label) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.bricolageGrotesque(fontSize: 16),
        ),
      ],
    );
  }
  Widget buildDotWithLabelApp(Color color, String label) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: GoogleFonts.bricolageGrotesque(fontSize: 12),
        ),
      ],
    );
  }
}
