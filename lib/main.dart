import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider_test/counter_provider.dart';
import 'package:provider_practice/screens/forget_password.dart';
import 'package:provider_practice/screens/signup_screen.dart';

import 'configuration/approuter.dart';

import 'controller/counter_Controller.dart';
import 'controller/forgetPassword_controller.dart';
import 'controller/loginController.dart';
import 'controller/signUpController.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordController()),
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
      initialRoute: AppRouter.signupScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: AppRouter.key,
    );
  }
}



