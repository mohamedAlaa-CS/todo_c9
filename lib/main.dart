import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/views/login/login_view.dart';
import 'package:todo_app/views/signup/signup.dart';
import 'package:todo_app/views/update/update_view.dart';

import 'layout/home_layout.dart';
import 'views/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider<MyProvider>(
    create: (BuildContext context) => MyProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      themeMode:provider.themeMode ,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeLayoutView.routeName: (context) => HomeLayoutView(),
        UpdateView.routeName :(context)=> UpdateView(),
        LoginView.routeName :(context) => LoginView(),
        SignupView.routeName :(context) => SignupView()
      },
    );
  }
}
