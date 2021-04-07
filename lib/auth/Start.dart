import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:travel_application/auth/login.dart';
import 'package:travel_application/auth/signUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToSignUp() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 400.0,
              padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 30.0),
              child: Image(
                image: AssetImage("images/home_page.jpg"),
                fit: BoxFit.contain,
              ),
            ),
            //text container
            Container(
              alignment: Alignment.center,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'WELCOME TO                       ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xff001027),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' "TRAVEL MATE"',
                      style: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff007580),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 5.0),
              child: Text(
                'Discover new places and explore with us!!',
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            //button
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 55.0, right: 55.0, top: 10.0, bottom: 10.0),
                      onPressed: navigateToLogin,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffffe8d0),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff001027),
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
                      onPressed: navigateToSignUp,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffffe8d0),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Color(0xff001027),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}