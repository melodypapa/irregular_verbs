import 'package:flutter/material.dart';
import 'package:irregular_verbs/pages/forms.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentPage = 0;

  var _pages = [
    Text('Page 1 - Announcement'),
    EditFormPage(),
    SnackbarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Flutter Playground'),
      ),
      body: Center(child: _pages.elementAt(_currentPage),),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('Birthdays'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement),
            title: Text('Announcement'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            title: Text('data'),
          ),
        ],
        currentIndex: _currentPage,
        fixedColor: Colors.red,
        onTap: (int index) {
          setState(() {
            _currentPage = index;  
          });
        }
      ),
    );
    return scaffold;
  }
}
