import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_theme/blocs/theme.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of(context);

    return new Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Dark Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
            ),
            FlatButton(
              child: Text('Light Theme'),
              onPressed: () => _themeChanger.setTheme(ThemeData.light()),
            )
          ],
        ),
      ),
    );
  }
//
}
