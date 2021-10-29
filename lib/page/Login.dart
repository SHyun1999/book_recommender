import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:auth_buttons/auth_buttons.dart';

class Login extends StatefulWidget {
  @override
  _MyAppStateS createState() => _MyAppStateS();
}

class _MyAppStateS extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 7,
      backgroundColor: Colors.white,
      image: Image.asset('assets/logo.png'),
      loaderColor: Colors.lightGreen,
      photoSize: 150.0,
      navigateAfterSeconds: MyApp1(),
      gradientBackground: LinearGradient(
          colors: [Colors.lightBlue, Colors.lightGreen]),
    );
  }
}

class MyApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState1();
  }
}

class _MyAppState1 extends State<MyApp1> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'RobotoMono',
      ),
      home: Scaffold(
        body: Center(
          child: _isLoggedIn
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(150.0)),
                  color: Colors.green,
                ),
                height: 150,
                width: 150,
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  // backgroundImage:
                  //NetworkImage(_googleSignIn.currentUser.photoUrl),
                ),
              ),
              Text("Welcome! ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40.0,
                  )),
              Text("Margarito"/*_googleSignIn.currentUser.displayName*/,
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.purple[300],
                child: Text("Logout",
                    style: TextStyle(
                        fontSize: 35.0, color: Colors.grey[350])),
                onPressed: () {
                  _logout();
                },
              ),
              Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: Colors.green[300],
                  child: Text('Main menu',
                      style: TextStyle(
                          fontSize: 35.0, color: Colors.grey[300])),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/2');
                  },
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Image.asset('assets/logo.png'),
              Container(

                child: GoogleSignInButton(
                  onPressed: () {
                    _login();
                  },
                  darkMode: true,
                  // default: false}
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}