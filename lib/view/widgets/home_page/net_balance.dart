import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/data_controller.dart';

class NetBalence extends StatelessWidget {
  const NetBalence({super.key});

  @override
  Widget build(BuildContext context) {
    final dataCtrl = Get.put(DataController());
    return Obx(
      () => Column(
        children: [
          Text(
            "\$${dataCtrl.netBalance.value}",
            style:
                GoogleFonts.kalnia(color: AppColors.profitColor, fontSize: 50),
          ),
          Text(
            "Net Balance",
            style:
                GoogleFonts.kalnia(color: AppColors.themeColor, fontSize: 20),
          ),
          Text(
            "${dataCtrl.changeInNetBal.value > 0 ? '+${dataCtrl.changeInNetBal.value.toStringAsFixed(2)}' : dataCtrl.changeInNetBal.value.toStringAsFixed(2)}\$ ${dataCtrl.percentChangeInNetBal.value.toStringAsFixed(2)}%",
            style: GoogleFonts.kanit(
                color: dataCtrl.changeInNetBal.value == 0
                    ? AppColors.themeColor
                    : dataCtrl.changeInNetBal.value < 0
                        ? AppColors.lossColor
                        : AppColors.profitColor,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
