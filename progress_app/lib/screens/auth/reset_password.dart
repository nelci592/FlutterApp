import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_app/screens/auth/auth_screen.dart';

class ResetPassord extends StatefulWidget {
  @override
  _ResetPassordState createState() => _ResetPassordState();
}

class _ResetPassordState extends State<ResetPassord> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning;

  Future sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool validate() {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      await sendPasswordResetEmail(_email);
      print("password reset link has been sent to $_email");
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Material(
        type: MaterialType.transparency,
        child: Theme(
          data: Theme.of(context)
              .copyWith(primaryColor: Color.fromRGBO(192, 192, 192, 1)),
          child: Builder(
            builder: (context) => Container(
              color: Colors.white,
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: deviceSize.height * 0.2,
                      width: deviceSize.width * 0.6,
                      padding: EdgeInsets.only(top: deviceSize.height * 0.05),
                      child: Image.asset('assets/images/progress.png'),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: deviceSize.height * 0.05),
                      child: Container(
                        height: deviceSize.height * 0.75,
                        width: deviceSize.width * 0.85,
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    child: Text('Reset password',
                                        //   _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            fontSize: 30,
                                            fontFamily: 'Segoe')),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: 
                                  TextFormField(
                                  key: ValueKey('email'),
                                  validator: (value) {
                                    if (value.isEmpty || !value.contains('@')) {
                                      return 'Please enter a valid email address.';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email address',
                                  ),
                                  onSaved: (value) {
                                    _email = value;
                                  },
                                ),
                                  // TextFormField(
                                  //   // validator: EmailValidator.validate,
                                  //   style: TextStyle(fontSize: 22.0),
                                  //   decoration: InputDecoration(
                                  //     hintText: "Email",
                                  //     filled: true,
                                  //     fillColor: Colors.white,
                                  //     focusColor: Colors.white,
                                  //     enabledBorder: OutlineInputBorder(
                                  //         borderSide: BorderSide(
                                  //             color: Colors.white, width: 0.0)),
                                  //     contentPadding: const EdgeInsets.only(
                                  //         left: 14.0, bottom: 10.0, top: 10.0),
                                  //   ),
                                  //   onSaved: (value) => _email = value,
                                  // ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {
                                        submit;
                                        print("The email is $_email");
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        AuthScreen()));
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromRGBO(111, 198, 25, 1),
                                                Color.fromRGBO(159, 235, 83, 1)
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 400.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Reset",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
