import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../models/SignUpData.dart';
import '../models/User.dart';
import '../services/AuthService.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String _countryCode = '+91';
  static final _formKey = GlobalKey<FormState>();
  SignUpData _signUpData = SignUpData();
  bool _tos = false;
  bool _referral = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Full Name*',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'Enter Full Name'),
                        validator: (String? value) {
                          if (value == null || value == "")
                            return "Full Name can't be blank";
                          else
                            return null;
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _signUpData.fullname = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Email*',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'Enter Email'),
                        validator: (String? value) {
                          String pattern =
                              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                              r"{0,253}[a-zA-Z0-9])?)*$";
                          RegExp regex = new RegExp(pattern);
                          if (value == null || value == "")
                            return 'Enter a valid email address';
                          else {
                            if (!regex.hasMatch(value))
                              return 'Enter a valid email address';
                            else
                              return null;
                          }
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _signUpData.email = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Password*',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'Enter Password'),
                        validator: (String? value) {
                          String pattern =
                              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$";
                          RegExp regex = new RegExp(pattern);
                          if (value == null || value == "")
                            return 'Enter a valid password';
                          else {
                            if (!regex.hasMatch(value))
                              return 'Enter a valid password';
                            else
                              return null;
                          }
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _signUpData.password = value;
                          });
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'Mobile Number*',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Container(
                              padding: EdgeInsets.only(right: 2.0),
                              height: 20,
                              child: CountryCodePicker(
                                onChanged: onCountryChange,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IN',
                                favorite: ['+91', 'IN'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            hintText: 'Enter Mobile Number'),
                        validator: (String? value) {
                          String pattern = r"^[\d]{10,}$";
                          RegExp regex = new RegExp(pattern);
                          if (value == null || value == "")
                            return 'Enter a valid mobile number';
                          else {
                            if (!regex.hasMatch(value))
                              return 'Enter a valid mobile number';
                            else
                              return null;
                          }
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _signUpData.mobile = value;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _referral,
                        onChanged: (value) {
                          setState(() {
                            _referral = value!;
                          });
                        },
                      ),
                      Text(
                        'Do you have a referral code?',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _tos,
                        onChanged: (value) {
                          setState(() {
                            _tos = value!;
                          });
                        },
                      ),
                      Text(
                        'I agree with the terms and conditions.',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: onSignUp,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 16.0),
                            child: Text(
                              'SignUp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSignUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final User user = await AuthService.signUp(_signUpData);
        Navigator.of(context)
            .pushReplacementNamed('/dashboard', arguments: {"user": user});
      } on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            content: Text(
              e.toString().substring(11),
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      }
    }
  }

  void onCountryChange(CountryCode countryCode) {
    setState(() {
      _countryCode = countryCode.toString();
    });
  }
}
