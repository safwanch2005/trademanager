import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/pages/add_pnl.dart';

FloatingActionButton homeFloatingActionButton() {
  return FloatingActionButton(
    backgroundColor: AppColors.profitColor,
    onPressed: () {
      Get.to(() => const AddPNLPage());
    },
    child: const Icon(Icons.add, color: AppColors.backgroundColor, size: 25),
  );
}
