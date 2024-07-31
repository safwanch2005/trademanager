import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

class HomeDailyRisk extends StatelessWidget {
  const HomeDailyRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Risk      :",
            style: GoogleFonts.poppins(
                color: AppColors.lossColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    // Adjust width
                    height: 15, // Adjust height
                    child: LinearProgressIndicator(
                      value: 0.75, // Progress value (0.0 to 1.0)
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.lossColor),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "0\$",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: AppColors.themeColor),
                    ),
                    Text(
                      "15\$",
                      style: GoogleFonts.poppins(
                          fontSize: 20, color: AppColors.lossColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
