import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/data_controller.dart';

class TodaysPNL extends StatelessWidget {
  const TodaysPNL({super.key});

  @override
  Widget build(BuildContext context) {
    final dataCtrl = Get.put(DataController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              " Today's P&L",
              style:
                  GoogleFonts.kalnia(color: AppColors.themeColor, fontSize: 40),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Card(
              color: AppColors.backgroundColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                // side: const BorderSide(
                //     color: AppColors.themeColor2, width: 1),
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.06,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: dataCtrl.todaysPnl.value >= 0
                              ? AppColors.profitColor
                              : AppColors.lossColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Text(
                          '+ ${dataCtrl.todaysPnl.value}\$',
                          style: GoogleFonts.kalnia(
                            color: AppColors.themeColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Profit : ${dataCtrl.todaysProfit.value}\$",
                          style: GoogleFonts.kalnia(
                              color: AppColors.profitColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Loss   : ${dataCtrl.todaysLoss.value}\$",
                          style: GoogleFonts.kalnia(
                              color: AppColors.lossColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '+6.3%',
                        style: GoogleFonts.kalnia(
                            color: AppColors.profitColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
