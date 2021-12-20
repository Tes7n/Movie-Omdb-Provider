// To parse this JSON data, do

import 'dart:convert';

// List<MovieModel> movieModelFromJson(String str) => List<MovieModel>.from(
//     json.decode(str).map((x) => MovieModel.fromJson(x)));

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  MovieModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.poster,
    this.ratings,
    this.imdbRating,
  });

  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;

  String? poster;
  List<Rating>? ratings;

  String? imdbRating;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["Title"],
        year: json["Year"],
        rated: json["Rated"],
        released: json["Released"],
        runtime: json["Runtime"],
        genre: json["Genre"],
        director: json["Director"],
        writer: json["Writer"],
        actors: json["Actors"],
        plot: json["Plot"],
        language: json["Language"],
        country: json["Country"],
        poster: json["Poster"],
        ratings:
            List<Rating>.from(json["Ratings"].map((x) => Rating.fromJson(x))),
        imdbRating: json["imdbRating"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Rated": rated,
        "Released": released,
        "Runtime": runtime,
        "Genre": genre,
        "Director": director,
        "Writer": writer,
        "Actors": actors,
        "Plot": plot,
        "Language": language,
        "Country": country,
        "Poster": poster,
        "Ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "imdbRating": imdbRating,
      };
}

class Rating {
  Rating({
    this.source,
    this.value,
  });

  String? source;
  String? value;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        source: json["Source"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Source": source,
        "Value": value,
      };
}
