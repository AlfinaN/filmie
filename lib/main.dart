import 'package:filmieapp/app/modules/home_page/home_page_view.dart';
import 'package:filmieapp/app/modules/onboarding/onboarding_view.dart';
import 'package:filmieapp/app/modules/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:filmieapp/app/modules/login/login_view.dart';

import 'app/modules/search/search_view.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeData,
        /* fungsi set theme dijadikan sebuah parameter pada home page
      agar dapat dijalankan pada class tersebut */
        home: HomePageView());
  }
}
