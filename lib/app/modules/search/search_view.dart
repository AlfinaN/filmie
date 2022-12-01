import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  // untuk memfilter list kemudian menampilkan data di bawah setelah di search
  void UpdateList(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Search",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(children: <Widget>[
              const SizedBox(height: 10),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "eg: Spiderman",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey))),
              ),
              SizedBox(height: 10),
            ])));
  }
}
