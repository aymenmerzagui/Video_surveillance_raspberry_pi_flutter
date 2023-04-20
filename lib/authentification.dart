import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/pallete.dart';
import 'package:untitled1/widgets/background-image.dart';

import 'package:untitled1/widgets/text-field-input.dart';
import '../widgets/password.dart';



import 'list_video.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
  }

  class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _signInWithEmailAndPassword() async {
  setState(() {
  _isLoading = true;
  });

  try {
  final String email = _emailController.text.trim();
  final String password = _passwordController.text.trim();
  await _auth.signInWithEmailAndPassword(
  email: email,
  password: password,
  );
  Navigator.pushNamed(context, '/home');
  } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
  print('Wrong password provided for that user.');
  }
  // Handle sign-in failure here.
  }
  setState(() {
  _isLoading = false;
  });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
  children: [
  BackgroundImage(
  image: 'assets/images/img_1.png',
  ),
  Scaffold(
  backgroundColor: Colors.transparent,
  body: Column(
  children: [
  Flexible(
  child: Center(
  child: Text(
  'MOTIONEYE',
  style: TextStyle(
  color: Colors.white,
  fontSize: 60,
  fontWeight: FontWeight.bold),
  ),
  ),
  ),
  Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
  TextInputField(
  controller: _emailController, // Declare the TextEditingController here
  icon: FontAwesomeIcons.envelope,
  hint: 'Email',
  inputType: TextInputType.emailAddress,
  inputAction: TextInputAction.next,
  ),
  Password(
  controller: _passwordController, // Declare the TextEditingController here
  icon: FontAwesomeIcons.lock,
  hint: 'Password',
  inputAction: TextInputAction.done,
  ),
  SizedBox(
  height: 25,
  ),
    GestureDetector(
      onTap: _isLoading ? null : () => _signInWithEmailAndPassword(),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kBlue,
        ),
        child: Center(
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    )

  ],
  ),
  SizedBox(
  height: 20,
  ),
  ],
  ),
  )
  ],
  );
  }
  }

