class NewsModel {
  const NewsModel({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlImage,
    required this.publishedAt,
  });

  final String? source;
  final String? title;
  final String? description;
  final String? url;
  final String? urlImage;
  final String? publishedAt;
}
