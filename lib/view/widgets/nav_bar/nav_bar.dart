// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/index_controller.dart';
import 'package:trademanager/view/pages/analysis_page.dart';
import 'package:trademanager/view/pages/home_page.dart';
import 'package:trademanager/view/pages/news_page.dart';
import 'package:trademanager/view/pages/settings.dart';
import 'package:trademanager/view/pages/target_page.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  var indexctrl = Get.put(IndexController());

  List<Widget> pages = [
    const HomePage(),
    NewsPage(),
    const AnalysisPage(),
    const TargetPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(() => pages.elementAt(indexctrl.index.value)),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColors.backgroundColor,
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodySmall:
                        GoogleFonts.poppins(color: AppColors.profitColor),
                  ),
            ),
            child: Obx(
              () => BottomNavigationBar(
                currentIndex: indexctrl.index.value,
                selectedItemColor: AppColors.profitColor,
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: AppColors.backgroundColor,
                    icon: FaIcon(
                      FontAwesomeIcons.house,
                      size: 20,
                      color: indexctrl.index.value == 0
                          ? AppColors.profitColor
                          : AppColors.themeColor,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: AppColors.backgroundColor,
                    icon: FaIcon(
                      FontAwesomeIcons.newspaper,
                      size: 20,
                      color: indexctrl.index.value == 1
                          ? AppColors.profitColor
                          : AppColors.themeColor,
                    ),
                    label: "News",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: AppColors.backgroundColor,
                    icon: FaIcon(
                      Icons.equalizer,
                      size: 20,
                      color: indexctrl.index.value == 2
                          ? AppColors.profitColor
                          : AppColors.themeColor,
                    ),
                    label: "Analysis",
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: AppColors.backgroundColor,
                    icon: FaIcon(
                      Icons.center_focus_weak,
                      size: 20,
                      color: indexctrl.index.value == 3
                          ? AppColors.profitColor
                          : AppColors.themeColor,
                    ),
                    label: "Targets",
                  ),
                  BottomNavigationBarItem(
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                      size: 20,
                      color: indexctrl.index.value == 4
                          ? AppColors.profitColor
                          : AppColors.themeColor,
                    ),
                    label: 'Settings',
                  ),
                ],
                onTap: (values) {
                  indexctrl.index.value = values;

                  indexctrl.fromHomeTextField = false;
                },
              ),
            ),
          )),
    );
  }
}
