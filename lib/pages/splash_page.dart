import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:seniorcare/pages/login_page.dart';
import 'package:seniorcare/utils/auth.dart';
import 'package:seniorcare/pages/home_page.dart';

class SplasPage extends StatefulWidget {
  static const routeName = 'splash';
  @override
  _SplasPageState createState() => _SplasPageState();
}

class _SplasPageState extends State<SplasPage> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final String token = await Auth.instance.accessToken;
    if(token != null){
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    }else{
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        )
      
    );
  }
}