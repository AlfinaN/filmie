import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:filmieapp/app/data/models/filmie_models.dart';

class FilmieService {
  static Future<List<FilmieModel>> fetchFilm() async {
    Response response = await Dio().get(
        "https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json");
    List<FilmieModel> ramens = (response.data['data'] as List)
        .map((v) => FilmieModel.fromJSON(v))
        .toList();
    return ramens;
  }

  static Future<Map<String, dynamic>> getDataFilm() async {
    Dio dio = Dio();
    var response = await dio.get(
        'https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;
    return dataResponse;
  }

  static Future<List<dynamic>> getDataFilmFake() async {
    Dio dio = Dio();
    var response = await dio.get('http://localhost:3000/data');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;

    return dataResponse;
  }

  // memfilter judul
  static Future<List<FilmieModel>> SearchFilm() async {
    Response response = await Dio().get(
        "https://my-does-app-5c4a7-default-rtdb.firebaseio.com/ramene.json");
    List<FilmieModel> ramens = (response.data['data'] as List)
        .map((v) => FilmieModel.fromJSON(v))
        .toList();
    return ramens;
  }
}
