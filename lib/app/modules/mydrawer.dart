import 'package:filmieapp/app/constants.dart';
import 'package:filmieapp/app/data/models/user_model.dart';
import 'package:filmieapp/app/modules/account/account_view.dart';
import 'package:filmieapp/app/modules/home_page/home_page_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class myDrawer extends StatefulWidget {
  int user;
  myDrawer({Key? key, required this.user}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: BlueAccent),
          child: null,
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePageView(
                    user: widget.user,
                  ),
                ));
          },
        ),
        ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: const Text('Akun'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new AccountView(user: widget.user)));
            }),
      ],
    );
  }
}
