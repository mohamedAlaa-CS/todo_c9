import 'package:flutter/material.dart';
import 'package:todo_app/core/my_theme.dart';

import 'layout/home_layout.dart';
import 'views/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeLayoutView.routeName: (context) => HomeLayoutView()
      },
    );
  }
}
