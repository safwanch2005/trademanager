import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trademanager/config/colors.dart';
import 'package:trademanager/controller/new_controller.dart';
import 'package:trademanager/view/widgets/news/news_details.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final newsCtrl = Get.put(NewsController());
    return FutureBuilder<List<Map<String, String>>>(
      future: newsCtrl.fetchCryptoNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.themeColor,
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No news available'));
        } else {
          final news = snapshot.data!;
          return ListView.builder(
            itemCount: news.length,
            itemBuilder: (context, index) {
              final article = news[index];
              return ListTile(
                title: Text(
                  article['title'] ?? '',
                  style: GoogleFonts.kanit(color: AppColors.themeColor),
                ),
                subtitle: Text(
                  article['published_at'] ?? '',
                  style: GoogleFonts.kanit(color: AppColors.themeColor2),
                ),
                trailing: const Icon(Icons.arrow_forward,
                    color: AppColors.themeColor),
                onTap: () {
                  Get.to(() => NewsDetailPage(url: article['url'] ?? ""));
                },
              );
            },
          );
        }
      },
    );
  }
}
