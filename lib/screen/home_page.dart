import 'package:flutter/material.dart';
import 'package:flutter_application_2/misc/colors.dart';
import 'package:flutter_application_2/screen/home_screen.dart';
import 'package:flutter_application_2/screen/not_found_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: FlutterLogo(size: 42.0),
      ),
      arrowColor: Colors.white,
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text('A'),
        ),
        CircleAvatar(
          backgroundColor: Colors.red,
          child: Text('B'),
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text('Колекций'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Not_Found_Screen()));
          },
        ),
        ListTile(
          title: const Text('Корзина'),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Not_Found_Screen()));
          },
        ),
        ListTile(
          title: const Text('Переключить акккаунты'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon:  Icon(Icons.menu, color: AppColors.blackArbuzColor,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
      body: HomeScreen(),
    );
  }
}
