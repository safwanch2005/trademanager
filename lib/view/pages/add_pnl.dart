import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/widgets/add_pnl/pnl_add_button.dart';
import 'package:trademanager/view/widgets/add_pnl/pnl_field.dart';

class AddPNLPage extends StatelessWidget {
  const AddPNLPage({super.key});

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
                "Add New",
                style: GoogleFonts.kalnia(
                    color: AppColors.themeColor, fontSize: 50),
              ),
              const PnlField(),
              const PnlAddButton(),
            ],
          ),
        ),
      ),
    );
  }
}
