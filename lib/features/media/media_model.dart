class MediaModel {
  const MediaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.createdAt,
  });

  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String createdAt;
}
