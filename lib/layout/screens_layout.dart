import 'package:flutter/material.dart';
import 'package:news_app/layout/sports_screen.dart';
import 'package:news_app/layout/technology_screen.dart';

import 'health_screen.dart';

class Screens_Layout extends StatefulWidget {
  const Screens_Layout({Key? key}) : super(key: key);

  @override
  _Screens_LayoutState createState() => _Screens_LayoutState();
}

class _Screens_LayoutState extends State<Screens_Layout> {
  int CurrentIndex = 0;
  List<Widget> Screens =[
    MyHomePage(),
    SportsScreen(),
    TechnologyScreen()
  ];

  List<String> AppbarTitles=[
    'الصحة',
    'الرياضة',
    'التكنولوجيا'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          Row(
            children: [
              Text(AppbarTitles[CurrentIndex],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(width: 20.0,),
            ],
          ),
        ],
      ),
      body: Screens[CurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        currentIndex: CurrentIndex,
        onTap: (index){
          setState(() {
            CurrentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety),
              label: 'الصحة'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_baseball_rounded),
              label: 'الرياضة'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.smartphone),
              label: 'التكنولوجيا'
          ),
        ],
      ),
    );

  }
}
