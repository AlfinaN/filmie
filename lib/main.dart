import 'package:flutter/material.dart';
import 'package:yuk_makan/app/modules/login/login_page_view.dart';
import 'package:yuk_makan/app/modules/onboarding/onboarding_view.dart';

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
        home: loginView());
  }
}
