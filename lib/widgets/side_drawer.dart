import 'package:flutter/material.dart';
import 'package:seniorcare/pages/home_page.dart';
import 'package:seniorcare/utils/auth.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Rolando Sanchez"),
              accountEmail: Text("rsanchezbaltodano@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://assets.soycarmin.com/__export/1592248167192/sites/debate/img/2018/02/12/la-sonrisa-de-selena.jpg_1130588308.jpg'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Job Map'),
              leading: Icon(Icons.map),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Notification'),
              leading: Icon(Icons.notification_important),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Tarining Videos'),
              leading: Icon(Icons.video_library_sharp),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Help'),
              leading: Icon(Icons.help),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Resources'),
              leading: Icon(Icons.source),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Legal'),
              leading: Icon(Icons.book),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () => Auth.instance.logOut(context),
            )
          ],
        ),
      ),
    ));
  }
}
