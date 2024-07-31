import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

class YearlyChart extends StatelessWidget {
  const YearlyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Yearly Performance",
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
      case 2024:
        text = '2024';
        break;
      case 2025:
        text = '2025';
        break;
      case 2026:
        text = '2026';
        break;
      case 2027:
        text = '2027';
        break;
      case 2028:
        text = '2028';
        break;
      case 2029:
        text = '2029';
        break;
      case 2030:
        text = '2030';
        break;
      case 2031:
        text = '2031';
        break;
      case 2032:
        text = '2032';
        break;
      case 2033:
        text = '2033';
        break;
      case 2034:
        text = '2034';
        break;
      case 2035:
        text = '2035';
        break;
      case 2036:
        text = '2036';
        break;
      case 2037:
        text = '2037';
        break;
      case 2038:
        text = '2038';
        break;
      case 2039:
        text = '2039';
        break;
      case 2040:
        text = '2040';
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
      -30.0, // 2024
      -10.0, // 2025
      10.0, // 2026
      40.0, // 2027
      // 70.0, // 2028
      // 100.0, // 2029
      // 80.0, // 2030
      // 50.0, // 2031
      // 20.0, // 2032
      // -10.0, // 2033
      // -30.0, // 2034
      // -20.0, // 2035
      // 0.0, // 2036
      // 20.0, // 2037
      // 40.0, // 2038
      // 60.0, // 2039
      // 80.0, // 2040
    ];

    return List.generate(data.length, (index) {
      return BarChartGroupData(
        x: 2024 + index,
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
