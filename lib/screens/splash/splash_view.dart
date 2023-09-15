import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/screens/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late bool testuser;

  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(
          testuser ? HomeLayoutView.routeName : LoginView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    testuser = provider.user;
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Image.asset(
        provider.themeMode == ThemeMode.light
            ? 'assets/images/splash_light.png'
            : 'assets/images/splash_dark.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
