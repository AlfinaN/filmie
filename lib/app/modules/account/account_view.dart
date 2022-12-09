import 'package:filmieapp/app/data/models/user_model.dart';
import 'package:filmieapp/app/modules/mydrawer.dart';
import 'package:filmieapp/app/modules/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants.dart';
import '../../data/models/user_model.dart';
import '../../service/filmie_service.dart';

class AccountView extends StatefulWidget {
  int user;
  AccountView({Key? key, required this.user}) : super(key: key);

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  TextStyle style2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle loading =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: lightGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BlueAccent,
        title: Text(
          "Account",
          style: TextStyle(color: Colors.white),
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
      ),
      drawer: Drawer(
        child: myDrawer(user: widget.user),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<UserModel>(
          future: FilmieService().fetchUser(widget.user),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                  //     Text(
                  //   'Server sedang error',
                  //   style: loading,
                  // ),
                  // apabila snapshot.data maka muncul Error: null karena gagal mengambil data
                );
              } else {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "assets/img_account.png",
                        ),
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        snapshot.data!.username,
                        style: const TextStyle(
                            color: BlueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        snapshot.data!.email,
                        style: const TextStyle(
                          color: darkGrey,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnboardingView()));
                        },
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(200, 60)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(semiRed),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: semiRed)))),
                        child: Text("Log out", style: style2),
                      ),
                    ]),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
