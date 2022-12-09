import 'package:filmieapp/app/data/models/user_model.dart';
import 'package:filmieapp/app/modules/account/account_view.dart';
import 'package:filmieapp/app/modules/home_page/home_page_view.dart';
import 'package:filmieapp/app/modules/onboarding/onboarding_view.dart';
import 'package:filmieapp/app/modules/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:filmieapp/app/modules/login/login_view.dart';

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
        home: const loginView());
  }
}
