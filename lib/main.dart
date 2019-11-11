import 'package:flutter/material.dart';

import 'Home.dart';
import 'landscape.dart';
import 'work.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyHomePageState();
  }
}



class _MyHomePageState extends State<MyApp> {

  int _selectedPage = 0;
  /*final _pageOption = [
    Text('Home', style: TextStyle(fontSize: 36.0),),
    Text('Work', style: TextStyle(fontSize: 36.0),),
    Text('Landscape', style: TextStyle(fontSize: 36.0),),
  ];*/
  final _pageOption = [
    HomePage(),
    WorkPage(),
    LandscapePage()
  ];

  Choice _selectedChoice = choices[0]; // The app's "state".

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Miledoo demo",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Miledoo"),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.search, color: Colors.white,),
              onPressed: () {
              },
            ),
            // action button
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white,),
              onPressed: () {
              },
            ),
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ]
        ),
        body: _pageOption[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Accueil')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.work),
                title: Text('Catégories')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.landscape),
                title: Text('Mon compte')
            ), 

          ],
        ),
      ),
    );
  }
}




class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];
