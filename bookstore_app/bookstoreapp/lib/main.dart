import 'package:bookstoreapp/screens/ad.dart';
import 'package:bookstoreapp/screens/bookExplorer.dart';
import 'package:flutter/material.dart';
Color navBarColor= Color(0xffC6B0A3);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget() ;

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  
  static  List _widgetOptions = [
    bookexplorer(),
   AddNewBook(),
    AddNewBook(),
    AddNewBook(),
  ];

  //METHOD TO SET STATE
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: Theme(
    data: Theme.of(context).copyWith(
        canvasColor: navBarColor,
        textTheme: Theme
            .of(context)
            .textTheme),
    child: BottomNavigationBar(
        fixedColor: navBarColor,
        backgroundColor: navBarColor,
        
        showSelectedLabels: true,
      showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:Text('Books',
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
              label: 'First',
            ),
            
            BottomNavigationBarItem(
               icon:Text('Access',
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
              label: 'third',
            ),
            BottomNavigationBarItem(
               icon:Text('News',
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
              label: 'forth',
            ),
            BottomNavigationBarItem(
               icon:Text('Add_book',
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
              label: 'fifth',
            ),
          ],
          onTap: _onItemTapped,

          currentIndex: _selectedIndex),
    )
    );
  }
}