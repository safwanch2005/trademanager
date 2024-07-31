import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/data_controller.dart';

class PnlField extends StatelessWidget {
  const PnlField({super.key});

  @override
  Widget build(BuildContext context) {
    final dataCtrl = Get.put(DataController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 250,
      height: 50,
      child: TextField(
        style: const TextStyle(color: AppColors.themeColor),
        controller: dataCtrl.pnlField,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: "Enter Amount",
          suffixText: "\$   ",
          suffixStyle:
              GoogleFonts.poppins(color: AppColors.themeColor, fontSize: 25),
          hintStyle:
              GoogleFonts.poppins(color: AppColors.themeColor, fontSize: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide:
                const BorderSide(color: AppColors.themeColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.themeColor, width: 2),
          ),
        ),
      ),
    );
  }
}
