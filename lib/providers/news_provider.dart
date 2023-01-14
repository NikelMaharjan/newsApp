




import 'package:news/models/news.dart';
import 'package:news/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final newsProvider = FutureProvider.family((ref, String searchKey) => NewsProvider.getNews(searchKey: searchKey));

class NewsProvider  {
 static Future<List<News>> getNews ({required String searchKey}) async {
  final data = await NewsService.getNews(searchKey: searchKey);
  return data;
 }
 }