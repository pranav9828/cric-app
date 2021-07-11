import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Home', true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: setMargin(15, 5, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  text('Live Matches', Colors.white70, FontWeight.w600, 18),
                  text('View All', Colors.white30, FontWeight.w600, 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
