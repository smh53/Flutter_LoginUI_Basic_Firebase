import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  String email, password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: Color(
            0xff5a5db4,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60,
                child: TextField(
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
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
                ),
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
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              FlatButton(
                child: Text('Kayıt ol'),
                color: Colors.red,
                onPressed: () async {
                  var user = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  print(user);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
