import 'package:flutter/material.dart';
import 'package:seniorcare/pages/home_page.dart';
import 'package:seniorcare/pages/login_page.dart';
import 'package:flutter/services.dart';
import 'package:seniorcare/pages/register_page.dart';
import 'package:seniorcare/pages/splash_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    return MaterialApp(
      title: 'Senior Care Services',
      theme: ThemeData(       
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplasPage(),
      routes: {
        RegisterPage.routeName:(_) => RegisterPage(),
        LoginPage.routeName: (_) => LoginPage(),
        HomePage.routeName:(_) => HomePage(),
      },
    );
  }
}
