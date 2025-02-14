// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:sellio/constants/colors.dart';
// import 'package:sellio/screens/setting/web/brand_screen.dart';
// import 'package:sellio/screens/setting/web/business_setting_screen.dart';
// import 'package:sellio/screens/setting/web/footer_detail_screen.dart';
// import 'package:sellio/screens/setting/web/system_setting_screen.dart';
//
//
// class SettingScreen extends StatefulWidget {
//   const SettingScreen({super.key});
//
//   @override
//   State<SettingScreen> createState() => _SettingScreenState();
// }
//
// class _SettingScreenState extends State<SettingScreen> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _tabs = [
//     const BrandSettings(),
//     const BusinessesSettings(),
//     const SystemSettings(),
//     const FooterDetails(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.simpleWhiteColor,
//       body: Row(
//         children: [
//           // Sidebar Menu
//           NavigationRail(
//             backgroundColor: AppColors.simpleWhiteColor.withOpacity(0.3),
//             indicatorColor: AppColors.whitePrimaryButton,
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: (int index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             labelType: NavigationRailLabelType.all,
//             destinations: [
//               NavigationRailDestination(
//                 icon: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: _selectedIndex == 0
//                         ? AppColors.whitePrimaryButton
//                         : AppColors.simpleWhiteColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.branding_watermark,
//                     color: _selectedIndex == 0
//                         ? AppColors.simpleWhiteColor
//                         : AppColors.whitePrimaryButton,
//                   ),
//                 ),
//                 selectedIcon: Icon(
//                   Icons.branding_watermark_outlined,
//                   color: _selectedIndex == 0
//                       ? AppColors.simpleWhiteColor
//                       : AppColors.whitePrimaryButton,
//                 ),
//                 label: Text(
//                   'Brand / Logo',
//                   style: GoogleFonts.nunito(
//                       fontSize: 14, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               NavigationRailDestination(
//                 icon: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: _selectedIndex == 1
//                         ? AppColors.whitePrimaryButton
//                         : AppColors.simpleWhiteColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.business,
//                     color: _selectedIndex == 1
//                         ? AppColors.whitePrimaryButton
//                         : AppColors.blackColor,
//                   ),
//                 ),
//                 selectedIcon: Icon(
//                   Icons.business_outlined,
//                   color: _selectedIndex == 1
//                       ? AppColors.simpleWhiteColor
//                       : AppColors.whitePrimaryButton,
//                 ),
//                 label: Text(
//                   'Businesses',
//                   style: GoogleFonts.nunito(
//                       fontSize: 14, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               NavigationRailDestination(
//                 icon: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: _selectedIndex == 2
//                         ? AppColors.whitePrimaryButton
//                         : AppColors.simpleWhiteColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.settings,
//                     color: _selectedIndex == 2
//                         ? AppColors.simpleWhiteColor
//                         : AppColors.blackColor,
//                   ),
//                 ),
//                 selectedIcon: Icon(
//                   Icons.settings_outlined,
//                   color: _selectedIndex == 2
//                       ? AppColors.simpleWhiteColor
//                       : AppColors.whitePrimaryButton,
//                 ),
//                 label: Text(
//                   'System Settings',
//                   style: GoogleFonts.nunito(
//                       fontSize: 14, fontWeight: FontWeight.w700),
//                 ),
//               ),
//               NavigationRailDestination(
//                 icon: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: _selectedIndex == 3
//                         ? AppColors.whitePrimaryButton
//                         : AppColors.simpleWhiteColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Icon(
//                     Icons.details,
//                     color: _selectedIndex == 3
//                         ? AppColors.simpleWhiteColor
//                         : AppColors.blackColor,
//                   ),
//                 ),
//                 selectedIcon: Icon(
//                   Icons.details_outlined,
//                   color: _selectedIndex == 3
//                       ? AppColors.simpleWhiteColor
//                       : AppColors.whitePrimaryButton,
//                 ),
//                 label: Text(
//                   'Footer Details',
//                   style: GoogleFonts.nunito(
//                       fontSize: 14, fontWeight: FontWeight.w700),
//                 ),
//               ),
//             ],
//           ),
//           // Main Content
//           Expanded(
//             child: _tabs[_selectedIndex],
//           ),
//         ],
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sellio/constants/colors.dart';
import 'package:sellio/screens/setting/mobile/brand_mobile_screen.dart';
import 'package:sellio/screens/setting/web/brand_screen.dart';
import 'package:sellio/screens/setting/web/business_setting_screen.dart';
import 'package:sellio/screens/setting/web/footer_detail_screen.dart';
import 'package:sellio/screens/setting/web/system_setting_screen.dart';

import 'mobile/businesssetting_mobile_screen.dart';
import 'mobile/footerdetail_mobile_screen.dart';
import 'mobile/system_mobile_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _selectedIndex = 0;

  final List<Widget> _webTabs = [
    const BrandSettings(),
    const BusinessSettingScreen(),
    const SystemSettingsScreen(),
    const FooterDetails(),
  ];

  final List<Widget> _mobileTabs = [
    const SettingBrandMobileScreen(),
    const BusinessSettingMobileScreen(),
    const SystemMobileScreen(),
    const FooterDetailMobileScreen(),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PopupMenuButton<int> _buildPopupMenuButton() {
    return PopupMenuButton<int>(
      onSelected: _onMenuItemSelected,
      itemBuilder: (context) => [
        _buildPopupMenuItem(0, Icons.branding_watermark, 'Brand / Logo'),
        _buildPopupMenuItem(1, Icons.business, 'Businesses'),
        _buildPopupMenuItem(2, Icons.settings, 'System Settings'),
        _buildPopupMenuItem(3, Icons.details, 'Footer Details'),
      ],
      icon: const Icon(
        Icons.more_vert,
        color: AppColors.whitePrimaryButton,
      ),
      color: AppColors.simpleWhiteColor,
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(
      int value, IconData icon, String label) {
    return PopupMenuItem<int>(
      value: value,
      child: Row(
        children: [
          Icon(
            icon,
            color: _selectedIndex == value
                ? AppColors.whitePrimaryButton
                : AppColors.blackColor,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.nunito(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: _selectedIndex == value
                  ? AppColors.whitePrimaryButton
                  : AppColors.blackColor,
            ),
          ),
        ],
      ),
    );
  }

  NavigationRail _buildNavigationRail() {
    return NavigationRail(
      backgroundColor: AppColors.simpleWhiteColor.withOpacity(0.3),
      indicatorColor: AppColors.whitePrimaryButton,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      destinations: [
        _buildNavigationRailDestination(
            icon: Icons.branding_watermark,
            label: 'Brand / Logo',
            selectedIndex: 0),
        _buildNavigationRailDestination(
            icon: Icons.business, label: 'Businesses', selectedIndex: 1),
        _buildNavigationRailDestination(
            icon: Icons.settings, label: 'System Settings', selectedIndex: 2),
        _buildNavigationRailDestination(
            icon: Icons.details, label: 'Footer Details', selectedIndex: 3),
      ],
    );
  }

  NavigationRailDestination _buildNavigationRailDestination(
      {required IconData icon,
      required String label,
      required int selectedIndex}) {
    return NavigationRailDestination(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: _selectedIndex == selectedIndex
              ? AppColors.whitePrimaryButton
              : AppColors.simpleWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: _selectedIndex == selectedIndex
              ? AppColors.simpleWhiteColor
              : AppColors.whitePrimaryButton,
        ),
      ),
      selectedIcon: Icon(
        icon,
        color: _selectedIndex == selectedIndex
            ? AppColors.simpleWhiteColor
            : AppColors.whitePrimaryButton,
      ),
      label: Text(
        label,
        style: GoogleFonts.nunito(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.simpleWhiteColor,
      body: ScreenTypeLayout.builder(
        mobile: (BuildContext context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
            _buildPopupMenuButton(),
                Text(
                  "Open Tabs",
                  style: GoogleFonts.nunito(
                      color: AppColors.whitePrimaryButton,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(child: _mobileTabs[_selectedIndex]),
          ],
        ),
        desktop: (BuildContext context) => Row(
          children: [
            _buildNavigationRail(),
            Expanded(child: _webTabs[_selectedIndex]),
          ],
        ),
      ),
    );
  }
}
