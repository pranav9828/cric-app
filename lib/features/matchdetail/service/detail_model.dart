class DetailModel {
  const DetailModel({
    required this.id,
    required this.seriesId,
    required this.matchTitle,
    required this.venue,
    required this.startDate,
    required this.endDate,
    required this.homeId,
    required this.homeName,
    required this.homeCode,
    required this.awayId,
    required this.awayName,
    required this.awayCode,
    required this.inPlay,
    required this.result,
    required this.status,
    required this.toss,
    required this.homeScores,
    required this.awayScores,
    required this.umpireOne,
    required this.umpireTwo,
    required this.umpireTv,
    required this.referee,
    required this.umpireReserve,
    required this.inningsNumber,
    required this.current,
    required this.title,
    required this.overs,
    required this.runs,
    required this.wickets,
    required this.extras,
    required this.fow,
    required this.currentRunRate,
  });

  final int id;
  final int seriesId;
  final String matchTitle;
  final String venue;
  final String startDate;
  final String endDate;
  final int homeId;
  final String homeName;
  final String homeCode;
  final int awayId;
  final String awayName;
  final String awayCode;
  final String inPlay;
  final String result;
  final String status;
  final String toss;
  final String homeScores;
  final String awayScores;
  final String umpireOne;
  final String umpireTwo;
  final String umpireTv;
  final String referee;
  final String umpireReserve;
  final int inningsNumber;
  final bool current;
  final String title;
  final String overs;
  final int runs;
  final String wickets;
  final int extras;
  final String fow;
  final String currentRunRate;
}
