import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './reset_password.dart';

class AuthForm extends StatefulWidget {
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  final void Function(
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userPassword = '';
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
          _userEmail.trim(), _userPassword.trim(), _isLogin, context);
    }
  }

  var _isLoading = false;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  // void _showErrorDialog(String message) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text('An Error Occurred!'),
  //       content: Text(message),
  //       actions: <Widget>[
  //         FlatButton(
  //           child: Text('Okay'),
  //           onPressed: () {
  //             Navigator.of(ctx).pop();
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

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
                          key: _formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    child: Text(_isLogin ? 'Login' : 'Sign up',
                                        //   _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(50, 50, 50, 1),
                                            fontSize: 30,
                                            fontFamily: 'Segoe')),
                                  ),
                                ),
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
                                    _userEmail = value;
                                  },
                                ),
                                TextFormField(
                                  key: ValueKey('password'),
                                  controller: _pass,
                                  validator: (value) {
                                    if (value.isEmpty || value.length < 7) {
                                      return 'Password must be at least 7 characters long.';
                                    }
                                    return null;
                                  },
                                  decoration:
                                      InputDecoration(labelText: 'Password'),
                                  obscureText: true,
                                  onSaved: (value) {
                                    _userPassword = value;
                                  },
                                ),
                                if (!_isLogin)
                                  TextFormField(
                                    key: ValueKey('password'),
                                    controller: _confirmPass,
                                    validator: (val) {
                                      if (val.isEmpty) return 'Empty';
                                      if (val != _pass.text) return 'Not Match';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Confirm password'),
                                    obscureText: true,
                                    onSaved: (value) {
                                      _userPassword = value;
                                    },
                                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                if (_isLoading)
                                  CircularProgressIndicator()
                                else
                                  Container(
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: _trySubmit,
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
                                            _isLogin ? 'Login' : 'Sign up',
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
                                FlatButton(
                                  child: Text(
                                    _isLogin
                                        ? 'Sign up instead'
                                        : 'Log in instead',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Segoe'),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  },
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  textColor: Color.fromRGBO(0, 0, 0, 1),
                                ),
                                FlatButton(
                                  child: Text(
                                    "Reset password",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontFamily: 'Segoe'),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ResetPassord()));
                                  },
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  textColor: Color.fromRGBO(0, 0, 0, 1),
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

//     return Center(
//       child: Card(
//         margin: EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   TextFormField(
//                     key: ValueKey('email'),
//                     validator: (value) {
//                       if (value.isEmpty || !value.contains('@')) {
//                         return 'Please enter a valid email address.';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       labelText: 'Email address',
//                     ),
//                     onSaved: (value) {
//                       _userEmail = value;
//                     },
//                   ),
//                   if (!_isLogin)

//                   TextFormField(
//                     key: ValueKey('password'),
//                     validator: (value) {
//                       if (value.isEmpty || value.length < 7) {
//                         return 'Password must be at least 7 characters long.';
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     onSaved: (value) {
//                       _userPassword = value;
//                     },
//                   ),
//                   SizedBox(height: 12),
//                   if (widget.isLoading) CircularProgressIndicator(),
//                   if (!widget.isLoading)
//                     RaisedButton(
//                       child: Text(_isLogin ? 'Login' : 'Signup'),
//                       onPressed: _trySubmit,
//                     ),
//                   if (!widget.isLoading)
//                     FlatButton(
//                       textColor: Theme.of(context).primaryColor,
//                       child: Text(_isLogin
//                           ? 'Create new account'
//                           : 'I already have an account'),
//                       onPressed: () {
//                         setState(() {
//                           _isLogin = !_isLogin;
//                         });
//                       },
//                     )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
