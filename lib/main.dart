import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project2/core/service/cache_helper.dart';
import 'package:project2/core/service/data%20source/api_service.dart';
import 'package:project2/core/service/data%20source/sqldb.dart';
import 'package:project2/core/service/local_notifacation_service.dart';
import 'package:project2/features/splash/presentation/view/splash_view.dart';
import 'package:project2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  CacheHelper.init();
  ApiService.init();
  Sqldb.db;
  await LocalNotifacationService.init();
  runApp(const Market());
}

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
