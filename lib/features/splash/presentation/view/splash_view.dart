import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:project2/features/auth/presentation/view/login_view.dart';
import 'package:project2/features/layout/presentation/manager/cubit/layout_cubit.dart';
import 'package:project2/features/layout/presentation/views/layout_view.dart';
import 'package:project2/features/onboarding/presentation/view/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      bool isOnBoardingSeen = CacheHelper.getBool('isOnBoardingSeen') ?? false;
      String token = CacheHelper.getString('token') ?? '';

      isOnBoardingSeen
          ? token.isNotEmpty
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (context) => LayoutCubit(),
                        child: LayoutView(),
                      ),
                    ),
                  )
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (context) => AuthCubit(),
                        child: LoginView(),
                      ),
                    ),
                  )
          : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => OnboardingView()),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/image/Shopping.json',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'dart:async';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Image.asset('assets/logo.png'),
//       ),
//     );
//   }
// }