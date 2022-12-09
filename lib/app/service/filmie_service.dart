import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:filmieapp/app/data/models/filmie_models.dart';

import '../data/models/user_model.dart';

class FilmieService {
  var baseurlapi = "http://localhost:3000";
  var dio = Dio();

  Future<List<FilmieModel>> fetchFilm() async {
    Response response = await Dio().get('$baseurlapi/data');
    List<FilmieModel> ramens =
        (response.data as List).map((v) => FilmieModel.fromJSON(v)).toList();
    return ramens;
  }

  Future<Map<String, dynamic>> getDataFilm() async {
    Dio dio = Dio();
    var response = await dio.get('$baseurlapi/data');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;
    return dataResponse;
  }

  // Future<List<dynamic>> getDataFilmFake() async {
  //   Dio dio = Dio();
  //   var response = await dio.get('$baseurlapi/data');
  //   print('status code : ${response.statusCode}');
  //   var dataResponse = response.data;

  //   return dataResponse;
  // }

  Future<UserModel> fetchUser(int id_user) async {
    Response response = await Dio().get('$baseurlapi/users/$id_user');
    UserModel users = UserModel.fromJSON(response.data);
    return users;
  }
}
