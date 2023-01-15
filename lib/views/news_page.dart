


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/loading.dart';
import 'package:news/widgets/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trending News Nepal"),
      ),
      body: Consumer(
        builder: (context, ref, child){
          final newsData = ref.watch(newsProvider);
          return SafeArea(
            child: Container(
              child: newsData.when(
                  data: (data){
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(10),

                              onTap: () async{

                                final Uri url = Uri.parse(data[index].url);


                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url, mode: LaunchMode.externalApplication);
                                } else {
                                  throw "Could not launch $url";
                                }

                              },
                               leading: Container(
                                 width: 100,
                                 child: CachedNetworkImage(
                                   imageUrl: data[index].urlToImage,
                                   fit: BoxFit.cover,
                                   placeholder: (context, url) => ImageLoad(),
                                   errorWidget: (context, url, error) => Icon(Icons.error),
                                 ),
                               ),
                                title: Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                    child: Text(data[index].title)),
                                subtitle: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(child: Text(data[index].source.name, style: const TextStyle(fontWeight: FontWeight.bold), )),
                                    Text(data[index].publishedAt.substring(0, 10)),
                                  ],
                                ),
                            ),
                          );
                        }
                    );
                  },
                  error: (err, stack) => Center(child: Text(err.toString()),),
                  loading: () =>  Loading()
              ),




            ),
          );
        },
      )
    );
  }
}
