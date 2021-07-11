import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';

class MediaFragment extends StatefulWidget {
  @override
  _MediaFragmentState createState() => _MediaFragmentState();
}

class _MediaFragmentState extends State<MediaFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: appBar('Media', true),
    );
  }
}
