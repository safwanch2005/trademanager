import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/auth_controller.dart';

Column signUpText() {
  final AuthController authController = Get.find<AuthController>();
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Sign",
        style: GoogleFonts.kalnia(color: AppColors.profitColor, fontSize: 70),
      ),
      Text(
        authController.isSignUpPage.value ? "Up" : "In",
        style: GoogleFonts.kalnia(color: AppColors.profitColor, fontSize: 100),
      ),
    ],
  );
}
