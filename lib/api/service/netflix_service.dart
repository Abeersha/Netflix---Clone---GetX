import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/api/model/netflix_model.dart';


List urls =[
"https://api.themoviedb.org/3/movie/upcoming?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1",
 "https://api.themoviedb.org/3/movie/popular?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1" ,
 "https://api.themoviedb.org/3/movie/now_playing?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1#",
 "https://api.themoviedb.org/3/tv/airing_today?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1",
 "https://api.themoviedb.org/3/tv/popular?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1",
"https://api.themoviedb.org/3/movie/latest?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US",
"https://api.themoviedb.org/3/tv/on_the_air?api_key=7bda99999b4e6d0bf70e0d22883a4bb4&language=en-US&page=1",
];

class NetflixService extends GetxController {
  Future<List<NetflixModel>?> getMethod(
    String url,
  ) async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await json.decode(response.body);
      List allData = body['results'];

      List<NetflixModel> modelClassData = allData
          .map((e) => NetflixModel(
              title: e['title'],
              date: e['release_date'],
              image: e['poster_path'],
              description: e['overview']))
          .toList();
      return modelClassData;
    } else {
      return null;
    }
  }
}
