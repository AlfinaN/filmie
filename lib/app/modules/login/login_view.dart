import 'package:dio/dio.dart';
import 'package:filmieapp/app/constants.dart';
import 'package:filmieapp/app/modules/home_page/home_page_view.dart';
import 'package:filmieapp/app/modules/register/register_view.dart';
import 'package:filmieapp/app/service/filmie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../onboarding/onboarding_view.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  TextStyle style2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OnboardingView()));
            },
            child: const Icon(
              Icons.arrow_back,
              color: semiBlack,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: SingleChildScrollView(
          child: Container(
            height: 600,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: const <Widget>[
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: semiBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text("Login to your account",
                          style: TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            fontFamily: 'Poppins Light',
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  controller: emailController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email Address",
                    hintText: "Email Address",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                TextField(
                  controller: pwdController,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Password",
                    hintText: "Password",
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     "Forgot password?",
                //     style: TextStyle(
                //       color: Colors.orangeAccent,
                //       fontSize: 16,
                //       fontFamily: 'Poppins Light',
                //     ),
                //   ),
                // ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    String usernamez, emailz, passwordz;
                    int id;

                    try {
                      var email = await Dio().get(
                          'http://localhost:3000/users?email=${emailController.text}');
                      var password = await Dio().get(
                          'http://localhost:3000/users?password=${pwdController.text}');
                      if (email.data.length > 0) {
                        if (password.data.length > 0) {
                          id = email.data[0]['id'];

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePageView(user: id)));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content: Text("Password Salah"),
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Text("Email Salah")));
                      }
                    } catch (e) {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(
                          "Ada kesalahan pada server",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(200, 60)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(BlueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(color: BlueAccent)))),
                  child: Text("Login", style: style2),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account yet?",
                        style: TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 16,
                          color: darkGrey,
                        )),
                    SizedBox(width: 0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterView()));
                      },
                      child: const Text("Sign up",
                          style: TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                            color: BlueAccent,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
