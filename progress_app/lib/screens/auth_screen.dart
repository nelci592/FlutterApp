import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../models/http_exception.dart';


enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(        
                    child: AuthCard(),
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

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {		
    showDialog(		
      context: context,		
      builder: (ctx) => AlertDialog(		
            title: Text('An Error Occurred!'),		
            content: Text(message),		
            actions: <Widget>[		
              FlatButton(		
                child: Text('Okay'),		
                onPressed: () {		
                  Navigator.of(ctx).pop();		
                },		
              )		
            ],		
          ),		
    );		
  }

   Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return  Container(
        width: deviceSize.width,
        padding: EdgeInsets.all(26.0),
        child: Column(
          children: <Widget>[
            SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Text(
                          _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
                          textAlign: TextAlign.left,
                          style: TextStyle(         
                              color: Color.fromRGBO(50, 50, 50, 1),
                              fontSize:40,
                              fontFamily: 'Segoe'
                              )),
                    ),
                  ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-Mail',    
              ),
              style: TextStyle(         
                              fontSize:18,
                              fontFamily: 'Segoe'
                              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty || !value.contains('@')) {
                  return 'Invalid email!';
                }
              },
              onSaved: (value) {
                _authData['email'] = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              style: TextStyle(         
                              fontSize:18,
                              fontFamily: 'Segoe'
                              ),
              controller: _passwordController,
              validator: (value) {
                if (value.isEmpty || value.length < 5) {
                  return 'Password is too short!';
                }
              },
              onSaved: (value) {
                _authData['password'] = value;
              },
            ),
            if (_authMode == AuthMode.Signup)
              TextFormField(
                enabled: _authMode == AuthMode.Signup,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                style: TextStyle(         
                              fontSize:18,
                              fontFamily: 'Segoe'
                              ),
                validator: _authMode == AuthMode.Signup
                    ? (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match!';
                        }
                      }
                    : null,
              ),
            SizedBox(
              height: 50,
            ),
            if (_isLoading)
              CircularProgressIndicator()
            else
              Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: _submit,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
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
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
                        textAlign: TextAlign.center,
                        style: TextStyle(       
                              color: Colors.white, 
                              fontSize:20,
                              fontFamily: 'Segoe'
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            FlatButton(
              child: Text(
                  '${_authMode == AuthMode.Login ? 'Sign up' : 'Log in'} Instead',
                   style: TextStyle(         
                              color: Colors.black,
                              fontSize:18,
                              fontFamily: 'Segoe'),),
              onPressed: _switchAuthMode,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textColor: Color.fromRGBO(0, 0, 0, 1),
            ),
          ],
        ),
      )
    ;
  }
}
