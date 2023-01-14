


import 'package:dio/dio.dart';
import 'package:news/exception.dart';
import 'package:news/models/news.dart';

class NewsService {


  static Future<List<News>> getNews({required String searchKey}) async {



    final dio = Dio();

    try{

      final response = await dio.get("https://newsapi.org/v2/everything?q=$searchKey&from=2022-12-14&sortBy=publishedAt&apiKey=d1ea3eea44c84e759b674d09c4aef521");
      final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
      return data;
    }

    on DioError catch  (err){
      throw DioException.fromDioError(err).errorMessage;

    }







  }


}