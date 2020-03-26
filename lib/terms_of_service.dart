import 'dart:ui';

import 'package:flutter/material.dart';

import 'main.dart';
import 'signup.dart';

class TermsOfService extends StatefulWidget {
  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.height * 0.02,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.015),
              child: Text(
                "Terms of Service",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Futura",
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Scrollbar(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  MediaQuery.of(context).size.height * 0.2,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: ListView(
                children: <Widget>[
                  TermsContainer(
                      condition:
                          "Drop (”we,” or ”us”) facilitates a mobile application to its users to get information related to current or upcoming blood donation campaigns nearby you, to be notified by hospitals during an emergency and donate blood to people in need and to keep track of the blood donated by himself/herself. By registering as an app user, you accept these Terms & Conditions (”Agreement”), which forms a binding agreement between you and Drop. If you do not wish to be bound by this Agreement, do not use the Drop Service."),
                  TermsTitleContainer(title: "Who May Use the Drop Service"),
                  TermsContainer(
                      condition:
                          "You must be at least 18 years old to use the Drop Service."),
                  TermsTitleContainer(title: "Privacy"),
                  TermsContainer(
                      condition:
                          "Your privacy rights are set forth in our Privacy Policy, which forms a part of this Agreement. Please review the Privacy Policy to learn about:"),
                  TermsPolicyContainer(
                      title:
                          "What information we may collect about you; What we use that information for; and With whom we share that information."),
                  InkWell(
                      child: SizedBox(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0,
                              MediaQuery.of(context).size.height * 0.015),
                          child: Text(
                            'View our Privacy Policy here.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Futura",
                              fontSize: 15.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          FadeRoute(page: PrivacyPolicy()),
                        );
                      }),
                  TermsTitleContainer(title: "Membership"),
                  TermsContainer(condition: "- Registration"),
                  TermsContainer(
                      condition:
                          "To use the Drop Service, you must register as a member by using your mobile number along with your full name, date of birth, valid email address, your height and weight, your blood group and current location. You must provide complete and accurate registration information to Drop. To register as a member into the app is absolutely free of cost while sending messages or calling hospitals through the app will be charged and deducted by your mobile network provider only."),
                  TermsContainer(condition: "- Account Security"),
                  TermsContainer(
                      condition:
                          "You are responsible for all activity that occurs under your account, including any activity by unauthorized users. If you become aware of an unauthorized access to your account, you must change your password and notify us immediately."),
                  TermsTitleContainer(title: "Terms and Termination"),
                  TermsContainer(condition: "- Terms"),
                  TermsContainer(
                      condition:
                          "This Agreement begins on the date you first use the Drop App and continues as long as you have an account with us. Drop reserves the right to modify or discontinue the Drop App with or without prior notice."),
                  TermsContainer(condition: "- Termination For Breach"),
                  TermsContainer(
                      condition:
                          "Drop may suspend, disable, or delete your account (or any part thereof) if Drop determines that you have violated any provision of this Agreement or that your conduct or content would tend to damage reputation and goodwill of Drop. If Drop deletes your account for the foregoing reasons, you may not re-register for the Drop Service."),
                  TermsContainer(condition: "- Effect of Termination"),
                  TermsContainer(
                      condition:
                          "Upon termination, all licenses granted by Drop to you will be terminated."),
                  TermsContainer(
                      condition:
                          "This Agreement constitutes the entire understanding between Drop and you concerning the subject matter hereof and supersedes all prior agreements and understandings regarding the same."),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.02,
                        MediaQuery.of(context).size.width * 0.0,
                        MediaQuery.of(context).size.height * 0.03),
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
                        "DONE",
                        style: TextStyle(
                          fontFamily: "Futura",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          FadeRoute(page: SignUp()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TermsContainer extends StatelessWidget {
  TermsContainer({Key key, this.condition}) : super(key: key);
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, 0.0, 0.0, MediaQuery.of(context).size.height * 0.015),
      child: Text(
        condition,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Futura",
          fontSize: 15.0,
        ),
      ),
    );
  }
}

class TermsTitleContainer extends StatelessWidget {
  TermsTitleContainer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, 0.0, 0.0, MediaQuery.of(context).size.height * 0.015),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "Futura",
          fontSize: 15.0,
        ),
      ),
    );
  }
}

class TermsPolicyContainer extends StatelessWidget {
  TermsPolicyContainer({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, 0.0, 0.0, MediaQuery.of(context).size.height * 0.015),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontFamily: "Futura",
          fontSize: 15.0,
        ),
      ),
    );
  }
}

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.height * 0.02,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.10,
            right: MediaQuery.of(context).size.width * 0.10,
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.015),
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Futura",
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Scrollbar(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.1,
                  MediaQuery.of(context).size.height * 0.2,
                  MediaQuery.of(context).size.width * 0.1,
                  0),
              child: ListView(
                children: <Widget>[
                  TermsContainer(
                      condition:
                          "Drop Team built the Drop app as a Free app. This SERVICE is provided by Drop Team at no cost and is intended for use as is."),
                  TermsContainer(
                      condition:
                          "This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service."),
                  TermsContainer(
                      condition:
                          "If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy."),
                  TermsContainer(
                      condition:
                          "The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Drop unless otherwise defined in this Privacy Policy."),
                  TermsTitleContainer(title: "Information Collection and Use"),
                  TermsContainer(
                      condition:
                          "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to First Name, Last Name, Gender, Date of Birth, Weight, Height, Blood Type. The information that we request will be retained by us and used as described in this privacy policy."),
                  TermsTitleContainer(title: "Log Data"),
                  TermsContainer(
                      condition:
                          "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics."),
                  TermsTitleContainer(title: "Cookies"),
                  TermsContainer(
                      condition:
                          "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory."),
                  TermsContainer(
                      condition:
                          "This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
                  TermsTitleContainer(title: "Security"),
                  TermsContainer(
                      condition:
                          "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."),
                  TermsTitleContainer(title: "Links to Other Sites"),
                  TermsContainer(
                      condition:
                          "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
                  TermsTitleContainer(title: "Children’s Privacy"),
                  TermsContainer(
                      condition:
                          "These Services do not address anyone under the age of 18. We do not knowingly collect personally identifiable information from children under 18. In the case we discover that a child under 18 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions."),
                  TermsTitleContainer(title: "Changes to This Privacy Policy"),
                  TermsContainer(
                      condition:
                          "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately after they are posted on this page."),
                  TermsTitleContainer(title: "Contact Us"),
                  TermsContainer(
                      condition:
                          "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at dropteam@gmail.com."),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.6,
                        MediaQuery.of(context).size.height * 0.02,
                        MediaQuery.of(context).size.width * 0.0,
                        MediaQuery.of(context).size.height * 0.03),
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
                        "DONE",
                        style: TextStyle(
                          fontFamily: "Futura",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          FadeRoute(page: SignUp()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
