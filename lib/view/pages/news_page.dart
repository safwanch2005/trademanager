import 'package:trademanager/config/colors.dart';
import 'package:trademanager/view/widgets/news/news_builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text('Crypto News',
              style: GoogleFonts.kanit(color: AppColors.themeColor)),
        ),
        body: const NewsBuilder());
  }
}
