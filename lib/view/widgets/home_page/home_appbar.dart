import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    title: Text('Hello Trader',
        style: GoogleFonts.kalnia(color: AppColors.themeColor, fontSize: 40)),
  );
}
