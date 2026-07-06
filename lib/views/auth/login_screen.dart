import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/icon/logo.png',
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 16),
            Text(
              'Employee Management',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                debugPrint('Email entered: ${_emailController.text}');
                debugPrint('Password entered: ${_passwordController.text}');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}