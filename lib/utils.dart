import 'package:flutter/material.dart';

const font_family = 'avenir_heavy';
const primary_color = Color(0xff02147B);
const secondary_color = Color(0xff0422cf);
var primaryColor = Color(0xffF54B64);

var primaryColor1 = Color(0xffF78361);

var secondaryColor = Color(0xff121212);

var darkGrey = Color(0xff4E586E);

var white = Color(0xffFFFFFF);
const api_key = 'JocMFPxeRDbn3TlCmawh89npfMo1';

Widget logo() {
  return Text(
    'Cricipedia',
    style: TextStyle(
      color: Colors.white,
      fontFamily: font_family,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
  );
}

PreferredSizeWidget appBar(String title, bool titleCenter) {
  return AppBar(
    backgroundColor: secondaryColor,
    elevation: 1.0,
    title: Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontFamily: font_family,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: titleCenter,
  );
}

Widget text(String text, Color color, FontWeight fontWeight, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: font_family,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

EdgeInsets setPadding(double left, double top, double right, double bottom) {
  return EdgeInsets.fromLTRB(left, top, right, bottom);
}

EdgeInsets setMargin(double left, double top, double right, double bottom) {
  return EdgeInsets.fromLTRB(left, top, right, bottom);
}

Widget imageView(String url) {
  return Image(
    image: NetworkImage(url),
    fit: BoxFit.contain,
  );
}

void sendToScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
