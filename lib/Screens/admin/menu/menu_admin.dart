import 'package:flutter/material.dart';
import 'package:test12/Screens/admin/dispatch/dispatch.dart';

const String page1 = "Dispatch";
const String page2 = "notification";
const String page3 = "more";
const String title = "Admin Page";

class ScreenMenu extends StatelessWidget {
  const ScreenMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late Widget _page3;
  late int _currentIndex;
  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _page1 = const Dispatch();
    _page2 = const Page2();
    _page3 = const Page3();
    _pages = [_page1, _page2, _page3];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _changeTab(index);
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: page1,
            icon: Icon(Icons.folder),
          ),
          BottomNavigationBarItem(
            label: page2,
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            label: page3,
            icon: Icon(Icons.more),
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      drawer: Drawer(
// Add a ListView to the drawer. This ensures the user can scroll
// through the options in the drawer if there isn't enough vertical
// space to fit everything.
        child: ListView(
// Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('oussama fellag'),
              accountEmail: Text('oussama.flg@gmail.com'),
              currentAccountPicture: CircleAvatar(
                radius: 1,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/user3.jpg',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6F35A5),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/nature.jpg'),
                ),
              ),
            ),
            ListTile(
              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
// Icon(Icons.account_box_rounded, color: Colors.black,),
                  Text('     item1',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
// Icon(Icons.local_shipping_sharp, color: Colors.black,),
                  Text('    item2',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationItemListTitle(String title, int index) {
    return ListTile(
      title: Text(
        '$title Page',
        style: TextStyle(color: Colors.purple, fontSize: 22.0),
      ),
      onTap: () {
        Navigator.pop(context);
        _changeTab(index);
      },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page1 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page2 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$page3 Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}
