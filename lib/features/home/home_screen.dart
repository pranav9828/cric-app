import 'package:cric_app/features/home/home_fragment.dart';
import 'package:cric_app/features/media/media_fragment.dart';
import 'package:cric_app/features/news/news_fragment.dart';
import 'package:cric_app/features/players/players_fragment.dart';
import 'package:cric_app/features/scores/scores_fragment.dart';
import 'package:cric_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeFragment(),
    NewsFragment(),
    MediaFragment(),
    ScoresFragment(),
    PlayersFragment(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.grey,
            ),
            label: 'Home',
            activeIcon: FaIcon(
              FontAwesomeIcons.home,
              color: white,
            ),
            backgroundColor: secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidNewspaper,
              color: Colors.grey,
            ),
            label: 'News',
            activeIcon: FaIcon(
              FontAwesomeIcons.solidNewspaper,
              color: white,
            ),
            backgroundColor: secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.fire,
              color: Colors.grey,
            ),
            label: 'Media',
            activeIcon: FaIcon(
              FontAwesomeIcons.fire,
              color: white,
            ),
            backgroundColor: secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.volleyballBall,
              color: Colors.grey,
            ),
            label: 'Scores',
            activeIcon: FaIcon(
              FontAwesomeIcons.volleyballBall,
              color: white,
            ),
            backgroundColor: secondaryColor,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.user,
              color: Colors.grey,
            ),
            label: 'Players',
            activeIcon: FaIcon(
              FontAwesomeIcons.user,
              color: white,
            ),
            backgroundColor: secondaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
