import 'package:expense/src/pages/analytics.dart';
import 'package:expense/src/pages/app.dart';
import 'package:expense/src/pages/home.dart';
import 'package:expense/src/pages/profile.dart';
import 'package:expense/src/pages/setting.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

import 'src/resources/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      initialRoute: 'index',
      routes: {
        'index': (context) => const App(), //Start Page
        'home': (context) => const Home(),
        'profile': (context) => const Profile(),
        'setting': (context) => const Setting(),
        'analytics': (context) => const Analytics()
      },
    );
  }
}
