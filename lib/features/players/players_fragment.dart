import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

class PlayersFragment extends StatefulWidget {
  @override
  _PlayersFragmentState createState() => _PlayersFragmentState();
}

class _PlayersFragmentState extends State<PlayersFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Players', true),
    );
  }
}
