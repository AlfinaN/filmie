import 'package:filmieapp/app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:filmieapp/app/data/models/filmie_models.dart';
import '../../service/filmie_service.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const TextStyle loading =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: lightGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('FFA600'),
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
      ),
      body: FutureBuilder<List<FilmieModel>>(
        future: FilmieService.fetchFilm(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Text(
              'Loading',
              style: loading,
            )); // apabila snapshot.data maka muncul null karena sedang proses menampilkan data
          } else {
            if (snapshot.hasError) {
              return Center(
                child: /*Text(
                    'Error: ${snapshot.error}'),*/
                    Text(
                  'Server sedang error',
                  style: loading,
                ),
                // apabila snapshot.data maka muncul Error: null karena gagal mengambil data
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
                      return Column(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "${snapshot.data![index].img_url}"))),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${snapshot.data![index].product_name}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${snapshot.data![index].price}",
                            style: const TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    },
                  )),
                ]),
              );
            }
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: HexColor('FFA600'),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
    );
  }
}
