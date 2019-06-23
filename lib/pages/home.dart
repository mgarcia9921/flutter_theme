import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_theme/blocs/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool _isDark = false;

  final List<Widget> _children = [
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.white)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: buildDrawer(context),
      body: _children[_currentIndex],
      bottomNavigationBar:  buildBottomNavigationBar() ,
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar (
      onTap: onTabTapped ,
      currentIndex: 0 ,
        items: [
          BottomNavigationBarItem (
              icon: new Icon(
                  Icons.home
              ) , title: new Text(
              'Home'
          )
          ) ,
          BottomNavigationBarItem (
              icon: new Icon(
                  Icons.rss_feed
              ) , title: new Text(
              'Feed'
          )
          ) ,
          BottomNavigationBarItem (
              icon: new Icon(
                  Icons.calendar_today
              ) , title: new Text(
              'Events'
          )
          ) ,
        ]
        );
  }

  Drawer buildDrawer(BuildContext context)  {
    ThemeChanger _themeChanger = Provider.of(context);


    onSwitchValueChanged(bool newVal) {
      setState(() {
        _isDark = newVal;
        if (newVal) {
          _themeChanger.setTheme(ThemeData.dark());
        } else {
          _themeChanger.setTheme(ThemeData.light());
        }
      });
    }

    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[Text('Dark Mode')],
                ),
                Column(
                  children: <Widget>[
                    Switch(
                        value: _isDark,
                        onChanged: (newVal) {
                          onSwitchValueChanged(newVal);
                        })
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
