import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

class ScoresFragment extends StatefulWidget {
  @override
  _ScoresFragmentState createState() => _ScoresFragmentState();
}

class _ScoresFragmentState extends State<ScoresFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Live Scores', true),
    );
  }
}
