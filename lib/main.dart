import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_gym_trainer/config/theme.dart';
import 'package:online_gym_trainer/firebase_options.dart';
import 'package:online_gym_trainer/firebasefunctions.dart/functions.dart';
import 'package:online_gym_trainer/screeens/splash.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: gymTheme,
      home: const SplashScreen()
    );
  }
}

