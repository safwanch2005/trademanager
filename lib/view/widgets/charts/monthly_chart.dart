import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

class MonthlyChart extends StatelessWidget {
  const MonthlyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monthly Performance",
            style: GoogleFonts.kalnia(
              color: AppColors.themeColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.70,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: leftTitleWidgets,
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                barGroups: _getBarGroups(),
                maxY: 100, // Set this according to your data's maximum value
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.poppins(
        fontWeight: FontWeight.bold, fontSize: 10, color: AppColors.themeColor);
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Jan';
        break;
      case 2:
        text = 'Feb';
        break;
      case 3:
        text = 'Mar';
        break;
      case 4:
        text = 'Apr';
        break;
      case 5:
        text = 'May';
        break;
      case 6:
        text = 'Jun';
        break;
      case 7:
        text = 'Jul';
        break;
      case 8:
        text = 'Aug';
        break;
      case 9:
        text = 'Sep';
        break;
      case 10:
        text = 'Oct';
        break;
      case 11:
        text = 'Nov';
        break;
      case 12:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = GoogleFonts.poppins(
        fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.themeColor);
    String text;
    switch (value.toInt()) {
      case -50:
        text = '-50';
        break;
      case 0:
        text = '0';
        break;
      case 50:
        text = '50';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  List<BarChartGroupData> _getBarGroups() {
    final data = [
      -30.0, // January
      -10.0, // February
      10.0, // March
      40.0, // April
      70.0, // May
      100.0, // June
      80.0, // July
      50.0, // August
      20.0, // September
      -10.0, // October
      -30.0, // November
      -20.0, // December
    ];

    return List.generate(data.length, (index) {
      return BarChartGroupData(
        x: index + 1,
        barRods: [
          BarChartRodData(
            toY: data[index],
            color: data[index] == 0
                ? AppColors.themeColor
                : data[index] < 0
                    ? AppColors.lossColor
                    : AppColors.profitColor,
            width: 10,
          ),
        ],
      );
    });
  }
}
