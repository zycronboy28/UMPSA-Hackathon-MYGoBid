import 'package:flutter/material.dart';
import 'package:mygobid/buypage.dart';
import 'appstate.dart'; // Import the AppState class
import 'package:mygobid/profilepage.dart';
import 'loginpage.dart';
import 'home.dart';
import 'sellpage.dart';
import 'settings.dart';
import 'buypage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Access the singleton instance
  final AppState appState = AppState();

  // List of pages to navigate to
  final List<Widget> _pages = [
    MainPage(),
    SellItemPage(),
    buyPage(),
    ProfileDetail(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      appState.selectedIndex = index; // Update the selected index in AppState
    });
  }

  void _onDrawerTapped(int index) {
    Navigator.pop(context); // Close the drawer
    setState(() {
      appState.selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          'MYGoBid',
          style: TextStyle(fontSize: 25),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'MYGoBid',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Malaysian 1st C2C Auctioning Apps',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.sell),
              title: const Text(
                'Sell',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.gavel),
              title: const Text(
                'Buy',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => _onDrawerTapped(2),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>SettingsPage()));
              },
            ),

           ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>UsernameForm())
                );
              },
            ),

            const SizedBox(height: 430),
            Text(
              'Product of INTEC CYBERHACKER.',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
            Text(
              ' All Rights Reserved®',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ],
        ),
      ),
      body: _pages[appState.selectedIndex], // Use the selected index from AppState
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sell, color: Colors.black),
              label: 'Sell',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money, color: Colors.black),
              label: 'Buy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people, color: Colors.black),
              label: 'Profile',
            ),
          ],
          currentIndex: appState.selectedIndex, // Use the selected index from AppState
          selectedItemColor: Colors.black, // Change selected item color to black
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

