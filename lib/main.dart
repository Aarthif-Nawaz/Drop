import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'welcome.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushAndRemoveUntil(
          ScaleRoute(page: Welcome()), (Route<dynamic> route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Image(
              image: AssetImage('assets/images/tagline.webp'),
            ),
          ),
        ],
      ),
    );
  }
}

// this is the background image
class BackgroundImage extends StatelessWidget {
  BackgroundImage({Key key, this.imagePath}) : super(key: key);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoadBackgroundImage extends StatelessWidget {
  LoadBackgroundImage({Key key, this.imagePath}) : super(key: key);
  final Image imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: imagePath,
    );
  }
}

// this is the blur effect of the background image
class BackgroundBackdropFilter extends StatelessWidget {
  BackgroundBackdropFilter({Key key, this.opacityValue, this.blurX, this.blurY})
      : super(key: key);
  final double opacityValue;
  final double blurX;
  final double blurY;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
      child: Container(
        color: Colors.black.withOpacity(opacityValue),
      ),
    );
  }
}

// this is the back arrow at the top of the page
class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: MediaQuery.of(context).size.height * 0.02,
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class NumberKeyboard extends StatefulWidget {
  @override
  _NumberKeyboardState createState() => _NumberKeyboardState();
}

class _NumberKeyboardState extends State<NumberKeyboard> {
  Widget _button(String number, Function() f) {
    // Creating a method of return type Widget with number and function f as a parameter
    return FlatButton(
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 14, 8, 14),
      splashColor: Color.fromRGBO(255, 132, 124, 1),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(9),
      ),
      onPressed: () {
        /*...*/
      },
      child: Text(
        number,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
          fontFamily: "Futura",
        ),
      ),
    );
  }

  Widget _clearButton(String number, Function() f) {
    // Creating a method of return type Widget with number and function f as a parameter
    return FlatButton(
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 14, 8, 14),
      splashColor: Color.fromRGBO(255, 132, 124, 1),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(9),
      ),
      onPressed: () {
        /*...*/
      },
      child: Text(
        number,
        style: TextStyle(
          fontSize: 20.0,
          fontFamily: "Futura",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Function() _num1;
    Function() _num2;
    Function() _num3;
    Function() _num4;
    Function() _num5;
    Function() _num6;
    Function() _num7;
    Function() _num8;
    Function() _num9;
    Function() _num0;
    Function() _clear;
    Function() _backspace;
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.46,
      left: MediaQuery.of(context).size.width * 0,
      right: MediaQuery.of(context).size.width * 0,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            0,
            MediaQuery.of(context).size.height * 0.015,
            0,
            MediaQuery.of(context).size.height * 0.015),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("1", _num1), // using custom widget _button
                _button("2", _num2),
                _button("3", _num3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("4", _num4), // using custom widget _button
                _button("5", _num5),
                _button("6", _num6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("7", _num7), // using custom widget _button
                _button("8", _num8),
                _button("9", _num9),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _clearButton("Clear", _clear),
                // using custom widget _button
                _button("0", _num0),
                _button("\u232b", _backspace),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 500),
        );
}

class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 500),
        );
}
