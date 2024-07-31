import 'package:flutter/material.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/widgets/home_page/floating_action_button.dart';
import 'package:trademanager/view/widgets/home_page/home_appbar.dart';
import 'package:trademanager/view/widgets/home_page/net_balance.dart';
import 'package:trademanager/view/widgets/home_page/todays_pnl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: homeAppBar(),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              NetBalence(),
              TodaysPNL(),
              //HomeDailyTarget(),
              SizedBox(
                height: 15,
              ),
              //HomeDailyRisk(),
              //HomeChart()
            ],
          ),
        ),
      ),
      floatingActionButton: homeFloatingActionButton(),
    );
  }
}
