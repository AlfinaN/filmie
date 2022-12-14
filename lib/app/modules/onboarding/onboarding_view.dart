import 'package:filmieapp/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../login/login_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  TextStyle style1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  TextStyle style2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                  height: 740,
                  width: 541,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/img_onboarding.png',
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 450),
                        child: Text(
                          'Filmie',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Text(
                          'Search Any Movie\nis Easy',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 60),
                          // width: 214,
                          // height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                      const Size(200, 60)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          BlueAccent),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side:
                                              BorderSide(color: BlueAccent)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loginView()));
                              },
                              child: Text('Get Started', style: style2))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
