import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 250,
      height: 50,
      child: TextField(
        style: const TextStyle(color: AppColors.themeColor),
        controller: controller,
        textAlign: TextAlign.center,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              GoogleFonts.poppins(color: AppColors.themeColor, fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: AppColors.profitColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: AppColors.profitColor, width: 2),
          ),
        ),
      ),
    );
  }
}
