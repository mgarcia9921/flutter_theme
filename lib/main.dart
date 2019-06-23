import 'package:flutter/material.dart';
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

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeChanger>(context);
    return new MaterialApp(
      home: Home(),
      theme: _theme.getTheme(),
    );
  }
}
