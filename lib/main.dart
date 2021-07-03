import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import './screens/Login.dart';
import '../screens/SignUp.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final ThemeData _theme = ThemeData(primaryColor: Color(0xff00bbd6));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _theme,
    home: LoginScreen(),
    routes: {
      '/login': (context) => LoginScreen(),
      '/signup': (context) => SignUpScreen()
    },
  ));
}
