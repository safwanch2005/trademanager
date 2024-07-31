import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

AppBar settingAppBar() {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    title: Text(
      "Settings",
      style: GoogleFonts.kalnia(color: AppColors.themeColor, fontSize: 40),
    ),
  );
}
