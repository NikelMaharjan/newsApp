




class News {


  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String publishedAt;

  News({required this.title, required this.description, required this.url, required this.urlToImage, required this.content, required this.publishedAt});


  factory News.fromJson(Map<String, dynamic> json){
    return News(
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        url: json['url'] ?? "",
        urlToImage: json['urlToImage'] ?? "",
        content: json['content'] ?? "",
        publishedAt: json['publishedAt'] ?? ""
    );
  }








}