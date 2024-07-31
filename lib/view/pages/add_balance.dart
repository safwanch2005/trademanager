import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/widgets/add_balance/add_balance_button.dart';
import 'package:trademanager/view/widgets/add_balance/add_balance_field.dart';

class AddBalancePage extends StatelessWidget {
  const AddBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Balance",
                style: GoogleFonts.kalnia(
                    color: AppColors.themeColor, fontSize: 50),
              ),
              const AddBalanceField(),
              const AddBalanceButton(),
            ],
          ),
        ),
      ),
    );
  }
}
