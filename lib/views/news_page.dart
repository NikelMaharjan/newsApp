


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/providers/news_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending News Nepal"),
      ),
      body: Consumer(
        builder: (context, ref, child){
          final newsData = ref.watch(newsProvider("Nepal"));
          return SafeArea(
            child: Container(
              child: newsData.when(
                  data: (data){
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),

                              onTap: () async{

                                final Uri url = Uri.parse(data[index].url);


                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                } else {
                                  throw "Could not launch $url";
                                }

                              },
                                title: Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                    child: Text(data[index].title)),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data[index].source.name, style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text(data[index].publishedAt.substring(0, 10)),
                                  ],
                                ),
                            ),
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
