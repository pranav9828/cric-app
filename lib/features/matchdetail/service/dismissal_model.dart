class DismissalModel {
  const DismissalModel({
    required this.isDismissal,
    required this.isBoundary,
    required this.isWide,
    required this.isMaiden,
    required this.isNoBall,
    required this.isBye,
    required this.isOverEnd,
    required this.currentOver,
    required this.runs,
    required this.isLegBye,
    required this.currentOverBall,
  });

  final bool isDismissal;
  final bool isBoundary;
  final bool isWide;
  final bool isMaiden;
  final bool isNoBall;
  final bool isBye;
  final bool isOverEnd;
  final int currentOver;
  final int runs;
  final bool isLegBye;
  final int currentOverBall;
}
