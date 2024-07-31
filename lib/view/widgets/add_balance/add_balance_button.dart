import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/data_controller.dart';

class AddBalanceButton extends StatelessWidget {
  const AddBalanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dataCtrl = Get.put(DataController());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: 250,
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              dataCtrl.addBalance(true);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              height: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.profitColor,
                  border: Border.all(color: AppColors.themeColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  "+",
                  style: GoogleFonts.poppins(
                      color: AppColors.themeColor, fontSize: 30),
                ),
              ),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              dataCtrl.addBalance(false);
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              height: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.lossColor,
                  border: Border.all(color: AppColors.themeColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  "-",
                  style: GoogleFonts.poppins(
                      color: AppColors.themeColor, fontSize: 30),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
