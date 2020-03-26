import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'email_verification.dart';
import 'main.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 450);
  static const _kCurve = Curves.ease;
  int currentIndexPage;
  int pageLength;

  Image image1;
  Image image2;
  Image image3;
  Image image4;
  Image image5;
  Image signupImage;
  Image loginImage;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 5;
    image1 = Image.asset(
      "assets/images/firstpage.jpg",
      fit: BoxFit.cover,
    );
    image2 = Image.asset(
      "assets/images/secondpage.webp",
      fit: BoxFit.cover,
    );
    image3 = Image.asset(
      "assets/images/thirdpage.webp",
      fit: BoxFit.cover,
    );
    image4 = Image.asset(
      "assets/images/fourthpage.webp",
      fit: BoxFit.cover,
    );
    image5 = Image.asset(
      "assets/images/fifthpage.webp",
      fit: BoxFit.cover,
    );
    signupImage = Image.asset(
      "assets/images/fifthpage.webp",
      fit: BoxFit.cover,
    );
    loginImage = Image.asset(
      "assets/images/login.webp",
      fit: BoxFit.cover,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1.image, context);
    precacheImage(image2.image, context);
    precacheImage(image3.image, context);
    precacheImage(image4.image, context);
    precacheImage(image5.image, context);
    precacheImage(signupImage.image, context);
    precacheImage(loginImage.image, context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _walkthroughOne = Material(
      child: new Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: image1,
          ),
          _backgroundImageOpacity(0),
          _descriptionText(
              "Drop is Sri Lanka's first virtual blood donation platform."),
          _nextButton(),
        ],
      ),
    );

    Widget _walkthroughTwo = Material(
      child: new Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: image2,
          ),
          _backgroundImageOpacity(0.3),
          _descriptionText(
              "Donate blood to people in need around you using the Drop network."),
          _backArrow(),
          _nextButton(),
        ],
      ),
    );

    Widget _walkthroughThree = Material(
      child: new Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: image3,
          ),
          _backgroundImageOpacity(0.3),
          _descriptionText("Find blood donation camps around you."),
          _backArrow(),
          _nextButton(),
        ],
      ),
    );

    Widget _walkthroughFour = Material(
      child: new Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: image4,
          ),
          _backgroundImageOpacity(0.4),
          _descriptionText("Let's help save a life. Be a donor. Be a hero."),
          _backArrow(),
          _nextButton(),
        ],
      ),
    );

    Widget _walkthroughFive = Material(
      child: new Stack(
        children: <Widget>[
          LoadBackgroundImage(
            imagePath: image5,
          ),
          _backgroundImageOpacity(0),
          _descriptionText(
              "We need your permission to connect you to hospitals nearby."),
          _backArrow(),
          // this is allow access button at the very bottom of the page
          Positioned(
            top: MediaQuery.of(context).size.height * 0.85,
            left: MediaQuery.of(context).size.height * 0.05,
            right: MediaQuery.of(context).size.height * 0.05,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height * 0.025, 0, 0),
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    FadeRoute(
                        page: EmailVerification(
                      backgroundImage: signupImage,
                    )),
                  );
                },
                icon: Icon(Icons.my_location),
                label: Text("Allow access"),
                color: Colors.white,
                hoverColor: Colors.black,
                splashColor: Colors.black,
                highlightColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _controller,
            children: <Widget>[
              _walkthroughOne,
              _walkthroughTwo,
              _walkthroughThree,
              _walkthroughFour,
              _walkthroughFive,
            ],
            onPageChanged: (value) {
              setState(() => currentIndexPage = value);
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.95,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.38),
              child: Align(
                alignment: Alignment.centerRight,
                child: new DotsIndicator(
                  dotsCount: pageLength,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                    size: Size.fromRadius(3),
                    activeSize: Size.fromRadius(5),
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    activeColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // this is the opacity of the background image
  Container _backgroundImageOpacity(double opacity) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, opacity),
    );
  }

  Positioned _backArrow() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: MediaQuery.of(context).size.height * 0.01,
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          _controller.previousPage(duration: _kDuration, curve: _kCurve);
        },
      ),
    );
  }

  // this is the description of the page
  Positioned _descriptionText(String descriptionText) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.73,
      left: MediaQuery.of(context).size.width * 0.10,
      right: MediaQuery.of(context).size.width * 0.10,
      child: Text(
        descriptionText,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Futura",
          fontSize: 25.0,
        ),
      ),
    );
  }

  Positioned _nextButton() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      right: MediaQuery.of(context).size.width * 0,
      child: Container(
        child: FlatButton(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(9),
          ),
          onPressed: () {
            _controller.nextPage(duration: _kDuration, curve: _kCurve);
          },
          child: Text(
            "Next",
            style: TextStyle(
              fontFamily: "Futura",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
