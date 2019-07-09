import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.tabItems,this.animationDuration = const Duration(milliseconds: 500),this.tabStyle}) : super(key: key);

  final List<TabItem> tabItems;
  final Duration animationDuration;
  final TabStyle tabStyle;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const List<String> tabNames = const<String>[
  'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
];

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


class _MyHomePageState extends State<MyHomePage>  with TickerProviderStateMixin  {

  int _screen = 0;
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabNames.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Navigation example'),
        ),
        body: new TabBarView(
          children: new List<Widget>.generate(tabNames.length, (int index) {
            switch (_screen) {
              case 0: return new Center(
                child: new Text('First screen, ${tabNames[index]}'),
              );
              case 1: return new Center(
                child: new Text('Second screen'),
              );
            }
          }),
        ),
        bottomNavigationBar: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           // new AnimatedCrossFade(
            //  firstChild:
              new Material(

                child: new TabBar(
                    labelPadding: EdgeInsets.only(bottom:10, right: 1.0, left: 1.0),
                  isScrollable: true,
                  tabs: _buildtabItems()

//                  new List.generate(tabNames.length, (index) {
//                    return new Tab(text: tabNames[index].toUpperCase(),icon: Icon(Icons.directions_transit),);
//                  }),
                ),
              ),
//              secondChild: new Container(),
//              crossFadeState: _screen == 0
//                  ? CrossFadeState.showFirst
//                  : CrossFadeState.showSecond,
//              duration: const Duration(milliseconds: 300),
           // ),
//            new BottomNavigationBar(
//              currentIndex: _screen,
//              onTap: (int index) {
//                setState(() {
//                  _screen = index;
//                });
//              },
//              items: [
//                new BottomNavigationTabItem(
//                  icon: new Icon(Icons.airplanemode_active),
//                  title: new Text('Airplane'),
//                ),
//                new BottomNavigationTabItem(
//                  icon: new Icon(Icons.motorcycle),
//                  title: new Text('Motorcycle'),
//                ),
//              ],
//            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildtabItems() {
    List<Widget> _tabItems = List();
    for (int i = 0; i < widget.tabItems.length; i++) {
      TabItem item = widget.tabItems[i];
      bool isSelected = selectedBarIndex == i;
      _tabItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
           // widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          duration: widget.animationDuration,
          decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget>[
              Icon(
                item.iconData,
                color: isSelected ? item.color : Colors.black,
                //size: widget.tabStyle.iconSize,
              ),
              SizedBox(
                width: 10.0,
              ),
              AnimatedSize(
                duration: widget.animationDuration,
                curve: Curves.easeInOut,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: TextStyle(
                      color: item.color,
                     // fontWeight: widget.tabStyle.fontWeight,
                     // fontSize: widget.tabStyle.fontSize
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return _tabItems;
  }


}
class TabItem {
  String text;
  IconData iconData;
  Color color;

  TabItem({this.text, this.iconData, this.color});
}

class TabStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;

  TabStyle({this.fontSize = 18.0, this.iconSize = 32, this.fontWeight = FontWeight.w600});
}