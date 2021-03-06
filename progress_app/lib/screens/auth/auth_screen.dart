import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './auth_form.dart';
import '../../screens/onboarding_screen.dart';
import '../Parking/parking_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String password,
    //String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => OnboardingScreen()));
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        setState(() {
          isLogin = true;
        });
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occurred, pelase check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: AuthForm(
          _submitAuthForm,
          _isLoading,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../providers/auth.dart';
// import '../models/http_exception.dart';

// enum AuthMode { Signup, Login }

// class AuthScreen extends StatefulWidget {
//   static const routeName = '/auth';
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Material(
//         type: MaterialType.transparency,
//         child: Theme(
//           data: Theme.of(context)
//               .copyWith(primaryColor: Color.fromRGBO(192,192,192, 1)),
//           child: Builder(
//             builder: (context) => Container(
//               color: Colors.white,
//               height: deviceSize.height,
//               width: deviceSize.width,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: deviceSize.height * 0.2,
//                       width: deviceSize.width * 0.6,
//                       padding: EdgeInsets.only(top: deviceSize.height * 0.05),
//                       child: Image.asset('assets/images/progress.png'),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: deviceSize.height * 0.05),
//                       child: AuthCard(),
//                     ),
//                   ]),
//             ),
//           ),
//         ));
//   }
// }

// class AuthCard extends StatefulWidget {
//   const AuthCard({
//     Key key,
//   }) : super(key: key);

//   @override
//   _AuthCardState createState() => _AuthCardState();
// }

// class _AuthCardState extends State<AuthCard> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.Login;
//   Map<String, String> _authData = {
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   final _passwordController = TextEditingController();

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         title: Text('An Error Occurred!'),
//         content: Text(message),
//         actions: <Widget>[
//           FlatButton(
//             child: Text('Okay'),
//             onPressed: () {
//               Navigator.of(ctx).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState.validate()) {
//       // Invalid!
//       return;
//     }
//     _formKey.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });
//     try {
//       if (_authMode == AuthMode.Login) {
//         // Log user in
//         await Provider.of<Auth>(context, listen: false).login(
//           _authData['email'],
//           _authData['password'],
//         );
//       } else {
//         // Sign user up
//         await Provider.of<Auth>(context, listen: false).signup(
//           _authData['email'],
//           _authData['password'],
//         );
//       }
//     } on HttpException catch (error) {
//       var errorMessage = 'Authentication failed';
//       if (error.toString().contains('EMAIL_EXISTS')) {
//         errorMessage = 'This email address is already in use.';
//       } else if (error.toString().contains('INVALID_EMAIL')) {
//         errorMessage = 'This is not a valid email address';
//       } else if (error.toString().contains('WEAK_PASSWORD')) {
//         errorMessage = 'This password is too weak.';
//       } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
//         errorMessage = 'Could not find a user with that email.';
//       } else if (error.toString().contains('INVALID_PASSWORD')) {
//         errorMessage = 'Invalid password.';
//       }
//       _showErrorDialog(errorMessage);
//     } catch (error) {
//       const errorMessage =
//           'Could not authenticate you. Please try again later.';
//       _showErrorDialog(errorMessage);
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _switchAuthMode() {
//     if (_authMode == AuthMode.Login) {
//       setState(() {
//         _authMode = AuthMode.Signup;
//       });
//     } else {
//       setState(() {
//         _authMode = AuthMode.Login;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Container(
//       height: deviceSize.height * 0.7,
//       width: deviceSize.width * 0.85,
//       child: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 width: double.infinity,
//                 child: Container(
//                   child: Text(
//                       _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Color.fromRGBO(50, 50, 50, 1),
//                           fontSize: 30,
//                           fontFamily: 'Segoe')),
//                 ),
//               ),
//               TextFormField(
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//                 decoration: InputDecoration(labelText: 'Email'),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value.isEmpty || !value.contains('@progress.com')) {
//                     return 'Please, enter valid email Progress email!';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _authData['email'] = value;
//                 },
//               ),
//               TextFormField(
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//                 decoration: InputDecoration(labelText: 'Password'),
//                 obscureText: true,
//                 controller: _passwordController,
//                 validator: (value) {
//                   if (value.isEmpty || value.length < 7) {
//                     return 'Password is too short!';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _authData['password'] = value;
//                 },
//               ),
//               if (_authMode == AuthMode.Signup)
//                 TextFormField(
//                   style: TextStyle(
//                     fontSize: 14,
//                   ),
//                   enabled: _authMode == AuthMode.Signup,
//                   decoration: InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                   validator: _authMode == AuthMode.Signup
//                       ? (value) {
//                           if (value != _passwordController.text) {
//                             return 'Passwords do not match!';
//                           }
//                           return null;
//                         }
//                       : null,
//                 ),
//               SizedBox(
//                 height: 20,
//               ),
//               if (_isLoading)
//                 CircularProgressIndicator()
//               else
//                 Container(
//                   height: 50.0,
//                   child: RaisedButton(
//                     onPressed: _submit,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0)),
//                     padding: EdgeInsets.all(0.0),
//                     child: Ink(
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color.fromRGBO(111, 198, 25, 1),
//                               Color.fromRGBO(159, 235, 83, 1)
//                             ],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                           borderRadius: BorderRadius.circular(10.0)),
//                       child: Container(
//                         constraints:
//                             BoxConstraints(maxWidth: 400.0, minHeight: 50.0),
//                         alignment: Alignment.center,
//                         child: Text(
//                           _authMode == AuthMode.Login ? 'Log in' : 'Sign up',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               FlatButton(
//                 child: Text(
//                   '${_authMode == AuthMode.Login ? 'Sign up' : 'Log in'} Instead',
//                   style: TextStyle(
//                       color: Colors.black, fontSize: 18, fontFamily: 'Segoe'),
//                 ),
//                 onPressed: _switchAuthMode,
//                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 textColor: Color.fromRGBO(0, 0, 0, 1),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
