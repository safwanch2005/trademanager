import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/auth_controller.dart';
import 'package:trademanager/view/pages/add_balance.dart';
import 'package:trademanager/view/widgets/settings/custom_setting_options.dart';
import 'package:trademanager/view/widgets/settings/setting_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: settingAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Get.to(() => const AddBalancePage());
                },
                child:
                    ProfileCustomBotton(text: "Add Balance", icon: Icons.add)),
            ProfileCustomBotton(text: "Percentage Finder", icon: Icons.percent),
            ProfileCustomBotton(text: "Clear All Data", icon: Icons.delete),
            GestureDetector(
                onTap: () async {
                  await authController.signOut();
                },
                child:
                    ProfileCustomBotton(text: "Log Out", icon: Icons.logout)),
          ],
        ),
      ),
    );
  }
}
