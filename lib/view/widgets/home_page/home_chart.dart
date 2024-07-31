import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

class HomeChart extends StatelessWidget {
  const HomeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Analysis",
            style: GoogleFonts.kalnia(
              color: AppColors.themeColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawHorizontalLine: true,
                  drawVerticalLine: true,
                  horizontalInterval: 10,
                  verticalInterval: 10,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 0.5,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return const FlLine(
                      color: Color(0xff37434d),
                      strokeWidth: 0.5,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 1,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 10,
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
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: const Color(0xff37434d)),
                ),
                minX: 1,
                maxX: 31,
                minY: -50,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(1, -30),
                      FlSpot(2, -10),
                      FlSpot(3, 10),
                      FlSpot(4, 40),
                      FlSpot(5, 70),
                      FlSpot(6, 100),
                      FlSpot(7, 80),
                      FlSpot(8, 50),
                      FlSpot(9, 20),
                      FlSpot(10, -10),
                      FlSpot(11, -30),
                      FlSpot(12, -20),
                      FlSpot(13, 0),
                      FlSpot(14, 20),
                      FlSpot(15, 40),
                      FlSpot(16, 60),
                      FlSpot(17, 80),
                      FlSpot(18, 100),
                      FlSpot(19, 70),
                      FlSpot(20, 50),
                      FlSpot(21, 30),
                      FlSpot(22, 10),
                      FlSpot(23, -10),
                      FlSpot(24, -30),
                      FlSpot(25, -40),
                      FlSpot(26, -20),
                      FlSpot(27, 0),
                      FlSpot(28, 20),
                      FlSpot(29, 40),
                      FlSpot(30, 60),
                      FlSpot(31, 80),
                    ],
                    isCurved: true,
                    color: AppColors.themeColor,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
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

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: Text('${value.toInt()}', style: style),
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
}
