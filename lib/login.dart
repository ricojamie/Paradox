import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paradox/signup.dart';

class AuthRepository {
  final _authclient = Supabase.instance.client.auth;

  Future<void> logIn(String email, String password) async {
    final response =
        await _authclient.signInWithPassword(email: email, password: password);
  }
}

final supabase = Supabase.instance.client;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final authrepository = AuthRepository();
  String? _errorMessage;

  Future<void> _handleLogIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await authrepository.logIn(email, password);
      Navigator.pushReplacementNamed(context, '/next');
    } catch (error) {
      setState(() {
        _errorMessage = error.toString();
      });
    }
  }

  Future SignOut() async {
    await supabase.auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleLogIn,
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text('Sign Up'),
          ),
          if (_errorMessage != null)
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                _errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            )
        ],
      ),
    );
  }
}
