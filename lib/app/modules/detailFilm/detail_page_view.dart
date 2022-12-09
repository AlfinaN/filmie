import 'package:filmieapp/app/data/models/filmie_models.dart';
import 'package:filmieapp/app/modules/home_page/home_page_view.dart';
import 'package:filmieapp/app/service/filmie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants.dart';

class DetailView extends StatefulWidget {
  int user;
  final FilmieModel detail;
  DetailView({Key? key, required this.user, required this.detail})
      : super(key: key);

  static const TextStyle Title =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: BlueAccent);

  static const TextStyle Plot =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: BlueAccent);

  static const TextStyle loading =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: lightGrey);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => HomePageView(user: 1)));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<FilmieModel>>(
          future: FilmieService().fetchFilm(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // apabila snapshot.data maka muncul null karena sedang proses menampilkan data
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
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Container(
                        width: double.infinity,
                        child: Stack(children: <Widget>[
                          Container(
                            height: 500,
                            width: 541,
                            // foregroundDecoration: BoxDecoration(
                            //   gradient: LinearGradient(
                            //     begin: Alignment.topCenter,
                            //     end: Alignment.bottomCenter,
                            //     colors: [
                            //       Colors.black.withOpacity(.0),
                            //       Colors.black.withOpacity(1),
                            //     ],
                            //   ),
                            // ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.detail.Poster),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 15, right: 15, top: 20),
                              margin: EdgeInsets.only(
                                top: 400,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: BlueAccent,
                                    blurRadius: 50.0,
                                    spreadRadius: 25,
                                    offset: Offset(
                                      -20,
                                      -20,
                                    ),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    widget.detail.Title,
                                    style: const TextStyle(
                                        color: BlueAccent,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    textAlign: TextAlign.left,
                                    widget.detail.Year,
                                    style: const TextStyle(
                                        color: darkGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.star_purple500_sharp,
                                          color: YellowFont,
                                        ),
                                        Text(" " + widget.detail.Star)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    widget.detail.Plot,
                                    style: const TextStyle(
                                      color: darkGrey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
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
