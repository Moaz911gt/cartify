import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:project2/features/auth/presentation/view/register_view.dart';
import 'package:project2/features/auth/presentation/view/widgets/custem_text_field.dart';
import 'package:project2/features/auth/presentation/view/widgets/custom_button.dart';

import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/layout/presentation/views/layout_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('logged in successfully')));

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => LayoutCubit(),
                child: LayoutView(),
              ),
            ),
          );
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('logged in failure')));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLooding,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/image/preview.png', width: 150),
                    SizedBox(height: 50),
                    CustomTextField(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person_outline),
                      hint: 'UserName',
                      onChanged: (data) {
                        nameController.text = data;
                      },
                      focusBorderColor: Colors.white,
                    ),
                    Divider(),
                    CustomTextField(
                      fillColor: Colors.white,
                
                      prefixIcon: Icon(Icons.lock_outline),
                      hint: 'password',
                      isPassword: true,
                      onChanged: (data) {
                        passwordController.text = data;
                      },
                      focusBorderColor: Colors.grey,
                    ),
                
                    Divider(),
                    SizedBox(height: 25),
                
                    CustomButton(
                      onTap: () {
                        submitLogin(context);
                      },
                      title: 'sign in',
                      color: Colors.lightBlue,
                      titleColor: Colors.white,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 80),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                  create: (context) => AuthCubit(),
                                  child: RegisterView(),
                                ),
                              ),
                            );
                          },
                
                          child: Row(
                            children: [
                              SizedBox(height: 50),
                              Text('dont have an account?'),
                              Text(
                                ' sign up',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ],
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
      },
    );
  }

  void submitLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      context.read<AuthCubit>().login(
        nameController.text,
        passwordController.text,
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
