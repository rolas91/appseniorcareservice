import 'package:flutter/material.dart';
import 'package:seniorcare/utils/responsive.dart';
import 'package:seniorcare/widgets/bezierContainer.dart';
import 'package:seniorcare/widgets/icon_container.dart';
import 'package:seniorcare/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double heightB = responsive.wp(80);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    top: -heightB * 0.45,
                    right: -heightB * 0.6,
                    child: BezierContainer()),
                // Positioned(
                //     top:-pinkSize * 0.4,
                //     right: -pinkSize * 0.2,
                //     child: Circle(
                //     size: pinkSize,
                //     colors: [
                //       Colors.pinkAccent,
                //       Colors.pink,
                //     ],
                //   ),
                // ),
                // Positioned(
                //     top:-orangeSize * 0.55,
                //     left: -orangeSize * 0.15,
                //     child: Circle(
                //     size: orangeSize,
                //     colors: [
                //       Colors.orange,
                //       Colors.deepOrangeAccent,
                //     ],
                //   ),
                // ),
                Positioned(
                  top: heightB * 0.35,
                  child: Column(
                    children: [
                      IconContainer(
                        size: responsive.wp(17),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        "Hola de nuevo  \n Bienvenido a Senior Care",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: responsive.dp(1.6)),
                      )
                    ],
                  ),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
