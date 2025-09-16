import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/features/auth/presentation/view/widgets/custom_button.dart';
import 'package:project2/features/profile/presentation/manager/cubit/user_info_cubit.dart';
import 'package:project2/features/splash/presentation/view/splash_view.dart';

class UserInfoBody extends StatelessWidget {
  const UserInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = context.read<UserinfoCubit>();
    return BlocBuilder<UserinfoCubit, UserinfoState>(
      builder: (context, state) {
        if (state is UserinfoLooding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserinfoFailure) {
          return const Center(child: Text('error'));
        }
        return Scaffold(
          appBar: AppBar(title: Center(child: Text('Profile'))),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width * .15,
                    backgroundImage: AssetImage(
                      'assets/image/4219872d-0389-4ebc-9db6-5ab30796bfdc.jpg',
                    ),
                  ),
                  SizedBox(height: size.height * .02),
              
                  Text(
                    cubit.nameController.text,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * .02),
              
                  Align(alignment: Alignment.centerLeft, child: Text('Name')),
                  SizedBox(height: size.height * .01),
              
                  CustomContainer(
                    item: cubit.nameController.text,
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(height: size.height * .02),
                  Align(alignment: Alignment.centerLeft, child: Text('email')),
                  SizedBox(height: size.height * .01),
              
                  CustomContainer(
                    item: cubit.emailController.text,
                    icon: Icon(Icons.email),
                  ),
                  SizedBox(height: size.height * .02),
              
                  Align(alignment: Alignment.centerLeft, child: Text('phone')),
                  SizedBox(height: size.height * .01),
              
                  CustomContainer(
                    item: cubit.phoneController.text,
                    icon: Icon(Icons.phone),
                  ),
                  SizedBox(height: size.height * .02),
              
                  Align(alignment: Alignment.centerLeft, child: Text('city')),
                  SizedBox(height: size.height * .01),
              
                  CustomContainer(
                    item: cubit.cityController.text,
                    icon: Icon(Icons.location_city),
                  ),
                  SizedBox(height: size.height * .02),
              
                  CustomButton(
                    onTap: () {
                      CacheHelper.setString('token', '');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SplashView()),
                      );
                    },
                    title: 'logout',
                    color: Colors.red,
                    titleColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.item, required this.icon});

  final String item;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            icon,
            SizedBox(width: size.width * .2),
            Text(item),
          ],
        ),
      ),
    );
  }
}
