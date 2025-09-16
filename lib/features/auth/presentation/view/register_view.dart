import 'package:flutter/material.dart';
import 'package:project2/features/auth/presentation/view/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
automaticallyImplyLeading: false,
        title: Center(child: Text('Sign Up New Account')),
        backgroundColor: Colors.white,
      ),
      body: RegisterViewBody(),
      backgroundColor: Colors.white,
    );
  }
}
