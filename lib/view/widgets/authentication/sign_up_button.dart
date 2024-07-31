import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/auth_controller.dart';

ElevatedButton signUpButton(context) {
  final ctrl = Get.put(AuthController());
  final AuthController authController = Get.find<AuthController>();
  return ElevatedButton(
    onPressed: () async {
      FocusScope.of(context).unfocus();
      if (ctrl.isSignUpPage.value) {
        await ctrl.signUp(
          userEmail: ctrl.email.text,
          password: ctrl.password.text,
        );
      } else {
        await ctrl.signIn();
      }
    },
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.profitColor),
    child: Text(
      authController.isSignUpPage.value ? "Sign Up" : "Sign In",
      style: GoogleFonts.kalnia(color: AppColors.themeColor),
    ),
  );
}
