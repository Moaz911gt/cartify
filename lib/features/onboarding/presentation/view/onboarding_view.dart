import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:project2/features/auth/presentation/view/login_view.dart';
import 'package:project2/features/splash/data/model/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  List<OnboardingModel> onBoardingData = [
    OnboardingModel(
      title: 'best store',
      subTitle: 'buy any thing you want',
      image:
          'assets/image/صورة واتساب بتاريخ 2025-08-06 في 15.28.51_ef75ea64.jpg',
    ),
    OnboardingModel(
      title: 'best prices',
      subTitle: 'a good prices for every thing',
      image: 'assets/image/image1.png',
    ),
    OnboardingModel(
      title: 'one stop shop',
      subTitle: 'you can buy whatever you want',
      image: 'assets/image/image2.png',
    ),
  ];

  void goToHome() {
    CacheHelper.setBool('isOnBoardingSeen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,

          children: [
            PageView.builder(
              controller: pageController,
              itemCount: onBoardingData.length,
              onPageChanged: (index) => setState(() => currentIndex = index),
              itemBuilder: (context, index) {
                final item = onBoardingData[index];

                return Column(
                  children: [
                    SizedBox(height: 16),

                    Text(item.title, style: TextStyle(fontSize: 24)),
                    SizedBox(height: 16),
                    Image.asset(
                      height: MediaQuery.sizeOf(context).height * .5,
                      fit: BoxFit.cover,
                      item.image,
                    ),
                    SizedBox(height: 16),
                    Text(item.subTitle, style: TextStyle(fontSize: 18)),
                  ],
                );
              },
            ),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 200),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingData.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: currentIndex == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentIndex == index ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .6,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8),
                        ),
                      ),
                      onPressed: currentIndex == onBoardingData.length - 1
                          ? goToHome
                          : () => pageController.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            ),
                      child: Text(
                        style: TextStyle(color: Colors.white),
                        currentIndex == onBoardingData.length - 1
                            ? 'start'
                            : 'next',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: goToHome,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .6,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          'skip',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


