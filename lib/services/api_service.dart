import 'package:http/http.dart' as http;
import 'package:movie_provider/models/movie_model.dart';

class ApiService {
  String movieName;
  ApiService({required this.movieName});
  static var client = http.Client();

  Future<MovieModel> fetchMovies() async {
    var response = await client.get(
        Uri.parse('https://www.omdbapi.com/?t=${movieName}&apikey=5504bd84'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      // print(jsonString);
      return movieModelFromJson(jsonString);
    }

    throw Error();
  }

  static void fetchmovie() {}
}
