import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seniorcare/utils/responsive.dart';
import 'package:seniorcare/widgets/avatar_button.dart';
import 'package:seniorcare/widgets/bezierContainer.dart';
import 'package:seniorcare/widgets/register_form.dart';



class RegisterPage extends StatefulWidget {
  static const routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);    
    final double heightB = responsive.wp(80);
    

    return Scaffold(
      body: GestureDetector(
          onTap: (){
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
                      top:-heightB * 0.45,
                      right: -heightB * 0.6,
                      child: BezierContainer()
                  ),                         
                  Positioned(
                    top: heightB * 0.35,
                    child:Column(
                      children: [                                               
                        Text(
                          "Hola\nRegístrate para empezar ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: responsive.dp(1.6) 
                          ),
                        ),
                        SizedBox(height: responsive.dp(4.5)),
                       AvatarButton(imageSize: responsive.wp(25),),
                      ],
                    ),                       
                  ),
                  RegisterForm(),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: SafeArea(child: CupertinoButton(
                        color: Colors.black26,
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_back),
                        borderRadius: BorderRadius.circular(30),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )                      
                ],
              ),
            ),
          ),
        ),
    );
  }
}