




import 'package:news/models/news.dart';
import 'package:news/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final newsProvider = FutureProvider((ref) => NewsProvider.getNews());

class NewsProvider  {
 static Future<List<News>> getNews () async {
  final data = await NewsService.getNews();
  return data;
 }
 }