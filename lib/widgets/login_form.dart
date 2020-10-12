import 'package:flutter/material.dart';
import 'package:seniorcare/api/seniorcare_api.dart';
import 'package:seniorcare/utils/responsive.dart';
import 'input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '', _password = '';

  _submit() {
    final isOK = _formkey.currentState.validate();
    if (isOK) {
      SeniorCareApi.instance.login(context, email: _email, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL ADDRESS",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text.contains('@')) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                          label: "PASSWORD",
                          oscureText: true,
                          borderEnabled: false,
                          fontSize:
                              responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                          onChanged: (text) {
                            _password = text;
                          },
                          validator: (text) {
                            if (text.trim().length == 0) {
                              return 'Invalid password';
                            }
                            return null;
                          }),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.5)),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: responsive.dp(5),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Sign in',
                      style: TextStyle(
                          color: Colors.white, fontSize: responsive.dp(1.5))),
                  onPressed: this._submit,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: responsive.dp(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Aún no tienes cuenta?',
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  )
                ],
              ),
              SizedBox(
                height: responsive.dp(19),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
