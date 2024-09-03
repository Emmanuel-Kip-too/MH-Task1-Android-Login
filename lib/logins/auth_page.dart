import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/logins/dashboard.dart';
import 'package:login/logins/loginorregister.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return  DashboardScreen(); 
          }

          // User is not logged in
          else {
            return const Loginorregister(); 
          }
        },
      ),
    );
  }
}
