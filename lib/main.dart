import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/screens/login/login_view.dart';
import 'package:todo_app/screens/signup/signup.dart';
import 'package:todo_app/screens/update/update_view.dart';

import 'layout/home_layout.dart';
import 'screens/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (BuildContext context) => MyProvider()..getUser()
        ..getTheme()
        ..getLanguage(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('------------------User is currently signed out!');
      } else {
        print(
            '------------------User is signed in! ${FirebaseAuth.instance.currentUser?.email}');
      }
    });

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const[
        AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales:const [
    Locale('en'), // English
    Locale('ar'), // Arabic
  ],
  locale: Locale(provider.language),
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      themeMode: provider.themeMode,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeLayoutView.routeName: (context) => HomeLayoutView(),
        UpdateView.routeName: (context) => UpdateView(),
        LoginView.routeName: (context) => LoginView(),
        SignupView.routeName: (context) => SignupView()
      },
    );
  }
}
