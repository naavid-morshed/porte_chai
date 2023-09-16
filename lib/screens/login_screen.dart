import 'package:flutter/material.dart';
import '../BackEnd/oauth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final OAuth _authMethods = OAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Welcome to Porte Chai',
              style: TextStyle(color: Colors.black87, fontSize: 32),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () async {
                if (await _authMethods.signInWithGoogle(context)) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
