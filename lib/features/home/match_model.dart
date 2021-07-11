class MatchModel {
  const MatchModel({
    required this.id,
    required this.seriesId,
    required this.venue,
    required this.date,
    required this.status,
    required this.result,
    required this.matchTitle,
    required this.matchSubtitle,
    required this.homeId,
    required this.homeName,
    required this.homeCode,
    required this.awayId,
    required this.awayName,
    required this.awayCode,
  });

  final int id;
  final int seriesId;
  final String venue;
  final String date;
  final String status;
  final String result;
  final String matchTitle;
  final String matchSubtitle;
  final int homeId;
  final String homeName;
  final String homeCode;
  final int awayId;
  final String awayName;
  final String awayCode;
}
