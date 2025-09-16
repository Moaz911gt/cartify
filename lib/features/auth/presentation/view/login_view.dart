import 'package:flutter/material.dart';
import 'package:project2/features/auth/presentation/view/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sign In Your Accont')),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: LoginViewBody(),
    );
  }
}
