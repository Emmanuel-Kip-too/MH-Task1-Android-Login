import 'package:flutter/material.dart';
import 'package:login/logins/login_page.dart';
import 'package:login/logins/registerpage.dart';

class Loginorregister extends StatefulWidget {
  const Loginorregister({super.key});

  @override
  State<Loginorregister> createState() => _LoginorregisterState();
}

class _LoginorregisterState extends State<Loginorregister> {
  //initially show login page
  bool showloginPage = true;

  //toggle between login and register page
  void togglePages () {
    setState(() {
      showloginPage = !showloginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginPage ) {
      return LoginPage(onTap: (togglePages),);
    } else {
      return RegisterPage(onTap: (togglePages),);
    }
  }
}