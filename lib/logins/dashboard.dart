import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/logins/login_page.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the signUserOut function inside the build method so it has access to the context
    void signUserOut() {
      FirebaseAuth.instance.signOut().then((_) {
        // Navigate to the LoginPage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage(onTap: null)),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              signUserOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Dashboard!'),
            SizedBox(height: 20), 
            MyButton(
              onTap: signUserOut,
              text: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
