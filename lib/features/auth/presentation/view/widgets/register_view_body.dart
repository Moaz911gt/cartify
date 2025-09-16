import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project2/features/auth/data/model/register_model.dart';
import 'package:project2/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:project2/features/auth/presentation/view/widgets/custem_text_field.dart';
import 'package:project2/features/auth/presentation/view/widgets/custom_button.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('sign up successfully')));
          Navigator.pop(context);
        }
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('sign up  failure')));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLooding,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: Form(
              autovalidateMode: autovalidateMode,
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/image/preview.png', width: 150),
                
                    CustomTextField(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person_outline),
                      hint: 'UserName',
                      controller: nameController,
                      onChanged: (data) {
                        nameController.text = data;
                      },
                      focusBorderColor: Colors.white,
                    ),
                    Divider(),
                    CustomTextField(
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email_outlined),
                      hint: 'Email',
                      controller: emailController,
                      onChanged: (data) {
                        emailController.text = data;
                      },
                      focusBorderColor: Colors.white,
                    ),
                    Divider(),
                    CustomTextField(
                      fillColor: Colors.white,
                
                      prefixIcon: Icon(Icons.lock_outline),
                      hint: 'password',
                      isPassword: true,
                      controller: passwordController,
                      onChanged: (data) {
                        passwordController.text = data;
                      },
                      focusBorderColor: Colors.grey,
                    ),
                
                    Divider(),
                    // CustomTextField(hint: 'Name', controller: nameController),
                    // SizedBox(height: 25),
                    // CustomTextField(hint: 'Email', controller: emailController),
                    // SizedBox(height: 25),
                    // CustomTextField(
                    //   hint: 'Password',
                    //   controller: passwordController,
                    // ),
                    SizedBox(height: 25),
                
                    CustomButton(
                      onTap: () {
                        submitRegister(context);
                      },
                      title: 'sign up',
                      color: Colors.lightBlue,
                      titleColor: Colors.white,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 80),
                
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              SizedBox(height: 50),
                
                              Text('already have an account?'),
                              Text(
                                ' Sign in',
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

  void submitRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      RegisterModel registerModel = RegisterModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        id: 100,
      );
      context.read<AuthCubit>().register(registerModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
