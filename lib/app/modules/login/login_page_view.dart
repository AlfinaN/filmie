import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class loginView extends StatefulWidget {
  const loginView({super.key});

  @override
  State<loginView> createState() => _loginViewState();
}

class _loginViewState extends State<loginView> {
  TextStyle style2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
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
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text("Login to your account",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontFamily: 'Poppins Light',
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                TextField(
                  //controller: emailController,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
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
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                TextField(
                  //controller: pwdController,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
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
                Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 214,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(200, 20)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                HexColor('FFCC00')),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                        color: HexColor('FFCC00'))))),
                        onPressed: () {},
                        child: Text('Login', style: style2))),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account yet?",
                        style: TextStyle(
                          fontFamily: 'Poppins Light',
                          fontSize: 16,
                          color: Colors.black54,
                        )),
                    SizedBox(width: 7),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign up",
                          style: TextStyle(
                            fontFamily: 'Poppins Light',
                            fontSize: 16,
                            color: Colors.amber,
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
