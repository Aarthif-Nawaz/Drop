import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'main.dart';

class Login extends StatefulWidget {
  final String firstName;
  Login(this.firstName);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obsureText = true;

  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          BackgroundImage(
            imagePath: "assets/images/login.webp",
          ),
          BackgroundBackdropFilter(
            opacityValue: 0.3,
            blurX: 3,
            blurY: 3,
          ),
          BackArrow(),

          // this is the description of the page
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.015),
              child: Text(
                "Welcome back, "+ widget.firstName,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Futura",
                  fontSize: 25.0,
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.01,
                  0,
                  MediaQuery.of(context).size.height * 0.01),
              height: 50,
              child: TextFormField(
                obscureText: _obsureText,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Futura",
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Futura",
                    color: Colors.white,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid, color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        style: BorderStyle.solid, color: Colors.white),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _obsureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    onPressed: () {
                      setState(() {
                        _obsureText = !_obsureText;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            left: MediaQuery.of(context).size.width * 0.08,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.015,
                  0,
                  MediaQuery.of(context).size.height * 0.015),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: EdgeInsets.all(9),
                hoverColor: Color.fromRGBO(255, 132, 124, 1),
                splashColor: Color.fromRGBO(255, 132, 124, 1),
                highlightColor: Color.fromRGBO(255, 132, 124, 1),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontFamily: "Futura",
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showAlertDialogResetPassword(context);
                },
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.87,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.015,
                  0,
                  MediaQuery.of(context).size.height * 0.015),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: EdgeInsets.all(9),
                hoverColor: Color.fromRGBO(255, 132, 124, 1),
                splashColor: Color.fromRGBO(255, 132, 124, 1),
                highlightColor: Color.fromRGBO(255, 132, 124, 1),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    fontFamily: "Futura",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    FadeRoute(page: Dashboard()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialogResetPassword(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Do you wish to reset your password?",
        style: TextStyle(
          fontFamily: "Futura",
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "A link will be sent to your email address. Please follow that link to reset your password. ",
        style: TextStyle(
          fontFamily: "Futura",
        ),
      ),
      actions: [
        FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(9),
          ),
          padding: EdgeInsets.all(9),
          hoverColor: Color.fromRGBO(255, 132, 124, 1),
          splashColor: Color.fromRGBO(255, 132, 124, 1),
          highlightColor: Color.fromRGBO(255, 132, 124, 1),
          child: Text(
            "No",
            style: TextStyle(
              fontFamily: "Futura",
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              fontSize: 15.0,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(9),
          ),
          padding: EdgeInsets.all(9),
          hoverColor: Color.fromRGBO(255, 132, 124, 1),
          splashColor: Color.fromRGBO(255, 132, 124, 1),
          highlightColor: Color.fromRGBO(255, 132, 124, 1),
          child: Text(
            "Yes",
            style: TextStyle(
              fontFamily: "Futura",
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
              fontSize: 15.0,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              FadeRoute(page: Login(widget.firstName)),
            );
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
