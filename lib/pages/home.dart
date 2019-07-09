import 'package:flutter/material.dart';
import 'package:flutter_theme/widget/navBar/CustomBottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_theme/blocs/theme.dart';
import 'package:flutter_theme/pages/social.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

const Map<String, IconData> _tabs = {
  'Home': Icons.home,
  'Sermon Notes': Icons.note,
  'Devotional': Icons.refresh,
  'Events': Icons.calendar_today,
  'Cell Groups': Icons.group,
  'Social': Icons.rss_feed,
  'Contact Us': Icons.contact_mail,

};

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool _isDark = false;

  final List<Widget> _children = [
    HomeScreeTopPart(),
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.white)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App 1'),
      ),
      drawer: buildDrawer(context),
      body: CustomBottomNavigationBar(),
      //body: _children[_currentIndex],
     // bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: buildBottomNavBarItems());
  }

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    List<BottomNavigationBarItem> navBar = new List();

    _tabs.forEach((k,v) => navBar.add(
          new BottomNavigationBarItem(

              icon: new Icon(v,color: Colors.black,),
              title: new Text(k,style: TextStyle(color: Colors.black),))));

    return navBar;
  }




  Drawer buildDrawer(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  //  mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[Text('Dark Mode')],
                ),
                Column(
                  //  mainAxisAlignment: MainAxisAlignment.end,
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
