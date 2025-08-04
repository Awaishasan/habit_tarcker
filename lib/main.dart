import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider_test/counter_provider.dart';
import 'package:provider_practice/screens/signup_screen.dart';

import 'configuration/approuter.dart';

import 'controller/counter_Controller.dart';
import 'controller/loginController.dart';
import 'controller/signUpController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.loginScreen,
      routes: AppRouter.routes,
    );
  }
}



