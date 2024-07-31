import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

// ignore: must_be_immutable
class ProfileCustomBotton extends StatelessWidget {
  ProfileCustomBotton({super.key, required this.text, required this.icon});
  dynamic text;
  dynamic icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.06,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.profitColor.withOpacity(0.9), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 10, // Blur radius
              offset: const Offset(0, 3), // Offset
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          FaIcon(
            icon,
            size: 20,
            color: AppColors.themeColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.06,
          ),
          Text(
            text,
            style:
                GoogleFonts.poppins(fontSize: 20, color: AppColors.themeColor),
          )
        ],
      ),
    );
  }
}
