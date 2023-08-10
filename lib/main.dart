import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_login/home.dart';
import 'package:my_login/login_screen.dart';
import 'package:my_login/provider/login.dart';
import 'package:my_login/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('hi'), // Hindi
        ],
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
