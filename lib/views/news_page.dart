


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/providers/news_provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child){
          final newsData = ref.watch(newsProvider("Nepal"));
          return SafeArea(
            child: Container(
              child: newsData.when(
                  data: (data){
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return ListTile(
                              title: Text(data[index].title)
                          );
                        }
                    );
                  },
                  error: (err, stack) => Center(child: Text(err.toString()),),
                  loading: () => Center(child: CircularProgressIndicator(),)
              ),




            ),
          );
        },
      )
    );
  }
}
