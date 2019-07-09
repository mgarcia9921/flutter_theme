import 'package:flutter/material.dart';
import 'package:flutter_theme/widget/buttons/animatedbutton/animated_bottom_bar.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.indigo,
    ),
    BarItem(
      text: "Sermon Notes",
      iconData: Icons.favorite_border,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Classes",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
    BarItem(
      text: "Daily devotional",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
    ),
    BarItem(
      text: "Events",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
    BarItem(
      text: "Social",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
    BarItem(
      text: "Contact Us",
      iconData: Icons.person_outline,
      color: Colors.teal,
    ),
  ];

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: widget.barItems[selectedBarIndex].color,
        duration: const Duration(milliseconds: 300),
      ),
      bottomNavigationBar: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBottomBar(
              barItems: widget.barItems,
              animationDuration: const Duration(milliseconds: 150),
              barStyle: BarStyle(fontSize: 20.0, iconSize: 30.0),
              onBarTap: (index) {
                setState(() {
                  selectedBarIndex = index;
                });
              })
        ],
      ),
    );
  }
}
