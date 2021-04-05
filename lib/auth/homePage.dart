import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_application/auth/Start.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isloggedIn = false;
  User user;

  //check Aunthenticatin
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Start()));
      }
    });
  }

  //check getuser
  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedIn = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: !isloggedIn
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    child: Image(
                      image: AssetImage('images/login.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                        'Hello!! ${user.displayName} you are logged In as ${user.email}.'),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                    onPressed: signOut,
                    color: Color(0xff001027),
                    child: Text(
                      'SIGNOUT',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffffe8d0),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
