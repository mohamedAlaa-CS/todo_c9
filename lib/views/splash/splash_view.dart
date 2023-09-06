import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';

class SplashView extends StatefulWidget {
  static const String routeName = 'splash_view';
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
Timer(Duration(seconds: 2), () {Navigator.of(context).pushReplacementNamed(HomeLayoutView.routeName); }) ;  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.transparent,
      body: Image.asset('assets/images/splash_light.png',height:mediaQuery.height ,width: mediaQuery.width,fit: BoxFit.fill,),
    );
  }
}