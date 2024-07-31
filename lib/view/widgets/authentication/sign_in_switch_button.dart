import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/auth_controller.dart';

InkWell switchToSignInPage() {
  final AuthController authController = Get.find<AuthController>();
  return InkWell(
    onTap: () {
      authController.isSignUpPage.value = !authController.isSignUpPage.value;
      authController.clearAllFields();
    },
    child: Text(
      authController.isSignUpPage.value ? "sign in" : "sign up",
      style: GoogleFonts.kalnia(color: AppColors.themeColor2, fontSize: 17),
    ),
  );
}
