import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_firebase_exa/screens/register_screen.dart';
import 'package:flutter_app_firebase_exa/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'logged_screen.dart';

bool loginFail;

// ignore: must_be_immutable
class WelcomeScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email, password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              kSpaceBetweenWidgets,
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.topStart,
                  child: OutlineButton(
                    hoverColor: Colors.white,
                    shape: PolygonBorder(sides: 6, rotate: 90),
                    onPressed: null,
                    borderSide: BorderSide(width: 3, color: Color(0xffa4adc0)),
                  ),
                ),
              ),
              kSpaceBetweenWidgets,
              Text(
                'H İ M E S',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    color: Color(
                      0xff5a5db4,
                    ),
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please Login to Continue.',
                style: TextStyle(
                    color: Color(0xff657287),
                    decoration: TextDecoration.none,
                    fontSize: 15),
              ),
              kSpaceBetweenWidgets,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60,
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 2.0),
                    prefixIcon: FaIcon(FontAwesomeIcons.user),
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffBCC3CB),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60,
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 2.0),
                    prefixIcon: FaIcon(FontAwesomeIcons.lock),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xffBCC3CB),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Builder(
                  builder: (context) => FlatButton(
                    onPressed: () {
                      print('Forgot Password Button Pressed');
                    },
                    hoverColor: Colors.white,
                    child: Text('Forgot Password?',
                        style: kForgotPasswordButtonTextStyle),
                  ),
                ),
              ),
              kSpaceBetweenWidgets,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                width: double.infinity,
                child: Builder(
                  builder: (context) => RaisedButton(
                    elevation: 5.0,
                    onPressed: () async {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      print(user.email);
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoggedScreen()));
                      }
                    },
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Color(0xff65caf5),
                    child: Text(
                      'Login \u003e',
                      style: kLoginButtonTitleTextStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: double.infinity,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Don\'t have an Account? ',
                                style: kGestureDetectorTextStyle),
                            TextSpan(
                                text: 'Sign Up',
                                style: kGestureDetectorTextStyle.copyWith(
                                    color: Color(0xffff855a))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
