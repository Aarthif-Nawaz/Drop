import 'dart:ui';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;

import 'package:validators/validators.dart';
import 'package:intl/intl.dart';

import 'login.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formkey = GlobalKey<FormState>();
  final snackBar =
      SnackBar(content: Text('Please Fill In The Above Details To Continue !'));
  static final validCharacters = RegExp(r'^[a-zA-Z]+$');
  TextEditingController fNameController = new TextEditingController();
  TextEditingController lNameController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController genderController = new TextEditingController();
  TextEditingController bloodTypeController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  static DateTime dateOf;

  static var bloodType = [
    "A +",
    "A -",
    "B +",
    "B -",
    "O +",
    "O -",
    "AB +",
    "AB -"
  ];

  bool obscureText1 = true;
  bool obsureText2 = true;
  int selectitem;
  bool value1 = false;
  var _isLoading = false;
  final wordStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Futura",
    fontSize: 18.0,
  );
  final borderStyle = BorderSide(style: BorderStyle.solid, color: Colors.white);
  final optionStyle = TextStyle(color: Colors.black, fontSize: 20);

  void value1Changed(bool value) => setState(() => value1 = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                BackgroundImage(
                  imagePath: "assets/images/fifthpage.webp",
                ),
                BackgroundBackdropFilter(
                  opacityValue: 0.4,
                  blurX: 5,
                  blurY: 5,
                ),
                BackArrow(),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.height * 0.05,
                      MediaQuery.of(context).size.height * 0.10,
                      MediaQuery.of(context).size.height * 0.05,
                      0.0),
                  child: Form(
                    key: _formkey,
                    child: new ListView(
                      children: <Widget>[
                        _signUpTextFormField("First Name", fNameController),
                        _signUpTextFormField("Last Name", lNameController),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.025,
                              0,
                              MediaQuery.of(context).size.height * 0.02),
                          height: 30,
                          child: InkWell(
                            child: SizedBox(
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(bottom: borderStyle),
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Choose Date Of Birth !";
                                      } else if (DateTime.now().year.toInt() -
                                              dateOf.year.toInt() <
                                          18) {
                                        return "You Must Be Over 18 Years Of Age !";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: dateController,
                                    decoration: InputDecoration(
                                        labelStyle: wordStyle,
                                        labelText: 'Date Of Birth'),
                                    textAlign: TextAlign.right,
                                    style: wordStyle,
                                  )),
                            ),
                            onDoubleTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          3,
                                      child: CupertinoDatePicker(
                                        initialDateTime: DateTime.now(),
                                        minimumYear: 1954,
                                        onDateTimeChanged: (DateTime newdate) {
                                          var date = DateFormat("dd-MM-yyyy")
                                              .format(newdate)
                                              .toString();
                                          setState(() {
                                            dateController.text = date;
                                            dateOf = newdate;
                                            print(dateOf.year);
                                            print(DateTime.now().year);
                                          });
                                        },
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.015,
                              0,
                              MediaQuery.of(context).size.height * 0.02),
                          height: 30,
                          child: InkWell(
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: borderStyle),
                                ),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Choose A Gender !";
                                      } else {
                                        return null;
                                      }
                                    },
                                    readOnly: true,
                                    controller: genderController,
                                    decoration: InputDecoration(
                                      labelText: 'Gender',
                                      labelStyle: wordStyle,
                                    ),
                                    textAlign: TextAlign.right,
                                    style: wordStyle),
                              ),
                            ),
                            onDoubleTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          5,
                                      child: CupertinoPicker(
                                        backgroundColor: Colors.white,
                                        children: <Widget>[
                                          Text(
                                            "Female",
                                            style: optionStyle,
                                          ),
                                          Text("Male", style: optionStyle)
                                        ],
                                        itemExtent: 38,
                                        //height of each item
                                        looping: false,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            if (index == 0) {
                                              genderController.text = "Female";
                                            } else if (index == 1) {
                                              genderController.text = "Male";
                                            } else {
                                              return null;
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.015,
                              0,
                              MediaQuery.of(context).size.height * 0.01),
                          height: 30,
                          child: InkWell(
                            child: SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: borderStyle,
                                  ),
                                ),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Please Choose A Blood Type !";
                                      } else {
                                        return null;
                                      }
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        labelStyle: wordStyle,
                                        labelText: 'Blood Type'),
                                    controller: bloodTypeController,
                                    textAlign: TextAlign.right,
                                    style: wordStyle),
                              ),
                            ),
                            onDoubleTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height /
                                          4,
                                      child: CupertinoPicker(
                                        backgroundColor: Colors.white,
                                        children: <Widget>[
                                          Text(
                                            "A +",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "A -",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "B +",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "B -",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "O +",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "O -",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "AB +",
                                            style: optionStyle,
                                          ),
                                          Text(
                                            "AB -",
                                            style: optionStyle,
                                          ),
                                        ],
                                        itemExtent: 40,
                                        //height of each item
                                        looping: false,
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            bloodTypeController.text =
                                                bloodType[index];
                                          });
                                        },
                                      ),
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,
                              MediaQuery.of(context).size.height * 0.01, 0, 0),
                          height: 30,
                          child: TextFormField(
                            obscureText: obscureText1,
                            style: wordStyle,
                            controller: passwordController,
                            textAlign: TextAlign.right,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Enter a Password';
                              } else if (value.length < 8) {
                                return 'Please Enter a strong password';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: wordStyle,
                              focusedBorder: _passwordUnderLineInputBorder(),
                              enabledBorder: _passwordUnderLineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  obscureText1
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureText1 = !obscureText1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0,
                              MediaQuery.of(context).size.height * 0.02,
                              0,
                              MediaQuery.of(context).size.height * 0.01),
                          height: 40,
                          child: TextFormField(
                            obscureText: obsureText2,
                            style: wordStyle,
                            textAlign: TextAlign.right,
                            controller: confirmPasswordController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Confirm Your Password';
                              } else if (value != getpass()) {
                                return 'Passwords Don\'t Match';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              labelStyle: wordStyle,
                              focusedBorder: _passwordUnderLineInputBorder(),
                              enabledBorder: _passwordUnderLineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  obsureText2
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obsureText2 = !obsureText2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
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
                        "CREATE ACCOUNT",
                        style: TextStyle(
                          fontFamily: "Futura",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                              validation();
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Container _signUpTextFormField(
      String textField, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.01,
          0, MediaQuery.of(context).size.height * 0.01),
      height: 30,
      child: TextFormField(
        style: wordStyle,
        controller: controller,
        textAlign: TextAlign.right,
        textCapitalization: TextCapitalization.words,
        validator: (value) {
          if (textField == "First Name") {
            if (value.isEmpty) {
              return 'Please Enter Your First Name';
            } else if (isNumeric(value)) {
              return 'Please Enter Only Characters';
            } else if (value.length < 3) {
              return 'Name should be more than 2 Characters';
            } else if (isAlphanumeric(value) && !isAlpha(value)) {
              return 'Please Enter Only Characters With No Numbers';
            }
          } else {
            if (value.isEmpty) {
              return 'Please Enter Your Last Name';
            } else if (isNumeric(value)) {
              return 'Please Enter Only Alphabets';
            } else if (value.length < 3) {
              return 'Name should be more than 2 Characters';
            } else if (isAlphanumeric(value) && !isAlpha(value)) {
              return 'Please Enter Only Characters With No Numbers';
            }
          }
        },
        decoration: InputDecoration(
          labelText: textField,
          labelStyle: wordStyle,
          focusedBorder: UnderlineInputBorder(
            borderSide: borderStyle,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: borderStyle,
          ),
        ),
      ),
    );
  }

  Future<void> addUser() async {
    const url = 'https://drop-8229e.firebaseio.com/users.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': DateTime.now().toString(),
          'FirstName': fNameController.text,
          'LastName': lNameController.text,
          'Gender': genderController.text,
          'DOB': dateController.text,
          'BloodType': bloodTypeController.text,
          'Password': passwordController.text,
        }),
      );
      Verification(
          id: json.decode(response.body)['name'],
          firstName: fNameController.text,
          lastName: lNameController.text,
          gender: genderController.text,
          dob: dateController.text,
          bloodType: bloodTypeController.text,
          password: passwordController.text);
      final id = json.decode(response.body)['name'];
      final urlUpdated = 'https://drop-8229e.firebaseio.com/users/$id.json';
      http.patch(urlUpdated,
          body: json.encode({
            'id': json.decode(response.body)['name'],
            'FirstName': fNameController.text,
            'LastName': lNameController.text,
            'Gender': genderController.text,
            'DOB': dateController.text,
            'BloodType': bloodTypeController.text,
            'Password': passwordController.text,
          }));
    } catch (error) {
      throw error;
    }
  }

  void validation() {
    if (_formkey.currentState.validate()) {
      setState(() {
        print('yes');
        _isLoading = true;
      });
      addUser().catchError((error) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occured !'),
                  content: Text('Something Went Wrong'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.red),
                      ),
                      splashColor: Colors.red,
                    )
                  ],
                ));
      }).then((_) {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pushAndRemoveUntil(
          FadeRoute(page: Login(fNameController.text)),
          (Route<dynamic> route) => false,
        );
      });
    }
  }

  UnderlineInputBorder _passwordUnderLineInputBorder() {
    return UnderlineInputBorder(
      borderSide: borderStyle,
    );
  }

  String getpass() {
    String password = passwordController.text;
    return password;
  }
}
