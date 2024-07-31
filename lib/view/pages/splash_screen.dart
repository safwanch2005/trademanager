import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/data_controller.dart';
import 'package:trademanager/view/widgets/nav_bar/nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    final ctrl = Get.put(DataController());
    await ctrl.retrieveAndAssignData();
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => BottomNavBar());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bar_chart,
                  color: AppColors.profitColor, size: 250),
              Text(
                "Trade Manager",
                textAlign: TextAlign.center,
                style: GoogleFonts.kalnia(
                    color: AppColors.profitColor, fontSize: 80),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
