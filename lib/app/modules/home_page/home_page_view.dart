import 'package:dio/dio.dart';
import 'package:filmieapp/app/constants.dart';
import 'package:filmieapp/app/modules/account/account_view.dart';
import 'package:filmieapp/app/modules/detailFilm/detail_page_view.dart';
import 'package:filmieapp/app/modules/mydrawer.dart';
import 'package:filmieapp/app/modules/account/account_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:filmieapp/app/data/models/filmie_models.dart';
import '../../service/filmie_service.dart';

class HomePageView extends StatefulWidget {
  int user;
  HomePageView({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  static const TextStyle loading =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: lightGrey);

  static const TextStyle Title =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: BlueAccent);

  static const TextStyle Year = TextStyle(fontSize: 12, color: Colors.black);

  // static List<Widget> _myPages = <Widget>[HomePageView(), AccountView(model: ), SearchView()];

  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BlueAccent,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
      ),
      drawer: Drawer(
        child: myDrawer(
          user: widget.user,
        ),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<FilmieModel>>(
        future: FilmieService().fetchFilm(),
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
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: <Widget>[
                  const SizedBox(height: 10),
                  Expanded(
                      child: GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailView(
                                        detail: snapshot.data![index],
                                        user: widget.user,
                                      )));
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "${snapshot.data![index].Poster}"))),
                            )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${snapshot.data![index].Title}",
                              style: Title,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${snapshot.data![index].Year}",
                              style: Year,
                            ),
                          ],
                        ),
                      );
                    },
                  )),
                ]),
              );
            }
          }
        },
      ),
    );
  }
}
