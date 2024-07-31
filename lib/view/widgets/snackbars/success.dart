import 'package:get/get.dart';
import 'package:trademanager/config/colors.dart';

successSnackbar(String title, String despription) {
  Get.snackbar(title, despription,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.profitColor);
}
