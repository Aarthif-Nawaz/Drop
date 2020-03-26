import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import 'main.dart';
import 'signup.dart';

class EmailVerification extends StatefulWidget {
  EmailVerification({Key key, this.backgroundImage}) : super(key: key);

  final Image backgroundImage;

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: widget.backgroundImage,
          ),
          BackgroundBackdropFilter(
            opacityValue: 0.2,
            blurX: 5,
            blurY: 5,
          ),
          BackArrow(),
          // this is the description of the page

          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Text(
              "Now let's set up an account to store all your details safely.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Futura",
                fontSize: 20.0,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.79,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                0,
                MediaQuery.of(context).size.height * 0.02,
                0,
                MediaQuery.of(context).size.height * 0.02,
              ),
              child: GoogleSignInButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeRoute(page: SignUp()),
                  );
                },
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.90,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Text(
              "We need to connect with your Google account to verify your personal details.",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Futura",
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
