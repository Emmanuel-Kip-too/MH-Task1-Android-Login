import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/mytextfield.dart';
import 'package:login/logins/dashboard.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );


      // pop the loading circle
      Navigator.pop(context);

      // Navigate to  page after successful sign-in, passing the username
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  DashboardScreen()),
      );
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // Show error message
      showErrorMessage(e.code);
    }
  }

  // error message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 243, 241),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/profile1.png',
                  width: 100,
                  height: 100,
                ),

                const SizedBox(height: 50),

                // Welcome message
                Text(
                  "look who's back! you've been missed!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                // Email TextField
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscuredText: false,
                ),

                const SizedBox(height: 15),

                // Password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscuredText: true,
                ),

                const SizedBox(height: 10),

                // Forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Sign in button
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),

                const SizedBox(height: 25),

                // Or continue with
                const Text('Or continue with'),

                const SizedBox(height: 15),

                // Google and Apple sign-in buttons (placeholders)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google button
                    Image.asset(
                      'lib/images/google.png',
                      height: 30,
                    ),

                    const SizedBox(width: 20),

                    // Apple button
                    IconButton(
                      onPressed: () {
                        // Handle Apple sign in
                      },
                      icon: const Icon(Icons.apple),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Not a member? Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
