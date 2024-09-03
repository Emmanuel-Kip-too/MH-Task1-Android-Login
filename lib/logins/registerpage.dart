import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/components/my_button.dart';
import 'package:login/components/mytextfield.dart';
import 'package:login/logins/dashboard.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Sign user up method
  void signUserUp() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Try to create user
    try {
      // Check if password is confirmed
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Navigate to dashboard screen on successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } else {
        // Show error message if passwords don't match
        Navigator.pop(context);
        showErrorMessage("Passwords do not match!");
      }
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // Show error message
      showErrorMessage(e.code);
    }
  }

  // Error message popup
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
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

                // Let's create an account
                Text(
                  "Let's create an account for you",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
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

                // Username TextField
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscuredText: false,
                ),

                const SizedBox(height: 15),

                // Password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscuredText: true,
                ),

                const SizedBox(height: 15),

                // Confirm Password TextField
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscuredText: true,
                ),

                const SizedBox(height: 25),

                // Sign up button
                MyButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                    GestureDetector(
                      onTap: () {
                        // Handle Google sign in
                      },
                      child: Image.asset(
                        'lib/images/google.png',
                        height: 30,
                      ),
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

                // Already have an account? Login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
