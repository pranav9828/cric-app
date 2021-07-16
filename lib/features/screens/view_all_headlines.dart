import 'package:cric_app/features/news/news_fragment.dart';
import 'package:flutter/material.dart';

class ViewAllHeadines extends StatefulWidget {
  const ViewAllHeadines({Key? key}) : super(key: key);

  @override
  _ViewAllHeadinesState createState() => _ViewAllHeadinesState();
}

class _ViewAllHeadinesState extends State<ViewAllHeadines> {
  @override
  Widget build(BuildContext context) {
    return NewsFragment();
  }
}
