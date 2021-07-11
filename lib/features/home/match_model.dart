class MatchModel {
  const MatchModel({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.teamOne,
    required this.teamTwo,
    required this.tossWinnerTeam,
    required this.winnerTeam,
    required this.matchStarted,
    required this.type,
  });

  final int? id;
  final String? date;
  final String? dateGmt;
  final String? teamOne;
  final String? teamTwo;
  final String? tossWinnerTeam;
  final String? winnerTeam;
  final bool? matchStarted;
  final String? type;
}
