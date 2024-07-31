import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  Future<List<Map<String, String>>> fetchCryptoNews() async {
    final response = await http.get(
      Uri.parse(
          'https://cryptopanic.com/api/v1/posts/?auth_token=a6ad226910c0c3601f5f4d1d538a21cb047305c7&public=true'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List newsArticles = data['results'];
      return newsArticles.map<Map<String, String>>((article) {
        return {
          "title": article['title'] ?? '',
          "published_at": article['published_at'] ?? '',
          "url": article['url'] ?? ''
        };
      }).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
