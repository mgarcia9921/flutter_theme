import 'package:flutter/material.dart';
import 'package:flutter_theme/pages/test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_theme/pages/home.dart';

import 'package:flutter_theme/blocs/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      builder: (_) => ThemeChanger(ThemeData.light()),
      child: new MaterialAppWithTheme(),
    );
  }
}

final List<TabItem> _tabItems = [
  TabItem(
    text: "Home",
    iconData: Icons.home,
    color: Colors.indigo,
  ),
  TabItem(
    text: "Sermon Notes",
    iconData: Icons.favorite_border,
    color: Colors.pinkAccent,
  ),
  TabItem(
    text: "Classes",
    iconData: Icons.person_outline,
    color: Colors.teal,
  ),
  TabItem(
    text: "Daily devotional",
    iconData: Icons.search,
    color: Colors.yellow.shade900,
  ),
  TabItem(
    text: "Events",
    iconData: Icons.person_outline,
    color: Colors.teal,
  ),
  TabItem(
    text: "Social",
    iconData: Icons.person_outline,
    color: Colors.teal,
  ),
  TabItem(
    text: "Contact Us",
    iconData: Icons.person_outline,
    color: Colors.teal,
  ),
];

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return new MaterialApp(
      //home: Home(),
      home: MyHomePage(tabItems: _tabItems,),
      theme: _theme.getTheme(),
    );
  }
}
