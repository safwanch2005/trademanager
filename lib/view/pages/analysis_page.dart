import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/widgets/charts/daily_chart.dart';
import 'package:trademanager/view/widgets/charts/monthly_chart.dart';
import 'package:trademanager/view/widgets/charts/yearly_chart.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Analysis",
          style: GoogleFonts.kalnia(color: AppColors.themeColor, fontSize: 40),
        ),
      ),
      body: ListView(
        children: const [
          DailyChart(),
          MonthlyChart(),
          YearlyChart(),
        ],
      ),
    ));
  }
}
