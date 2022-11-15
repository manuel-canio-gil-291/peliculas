// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponsefromJson(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';


//String nowPlayingResponsetoMap(NowPlayingResponse data) => json.encode(data.toMap());
//
//class NowPlayingResponse {
//    NowPlayingResponse({
//        required this.dates,
//        required this.page,
//        required this.movies,
//        required this.totalPages,
//        required this.totalMovies,
//    });
//
//    Dates dates;
//    int page;
//    List<Movie> movies;
//    int totalPages;
//    int totalMovies;
//
//    NowPlayingResponse nowPlayingResponseFromJson(String str) => NowPlayingResponse.fromJson(json.decode(str));
//
//    factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => NowPlayingResponse(
//        dates: Dates.fromJson(json["dates"]),
//        page: json["page"],
//        movies: List<Movie>.from(json["Movies"].map((x) => Movie.fromJson(x))),
//        totalPages: json["total_pages"],
//        totalMovies: json["total_Movies"],
//    );
//
//    Map<String, dynamic> toMap() => {
//        "dates": dates.toMap(),
//        "page": page,
//        "Movies": List<dynamic>.from(movies.map((x) => x.toMap())),
//        "total_pages": totalPages,
//        "total_Movies": totalMovies,
//    };
//}
//
//class Dates {
//    Dates({
//        required this.maximum,
//        required this.minimum,
//    });
//
//    DateTime maximum;
//    DateTime minimum;
//
//    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
//        maximum: DateTime.parse(json["maximum"]),
//        minimum: DateTime.parse(json["minimum"]),
//    );
//
//    Map<String, dynamic> toMap() => {
//        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
//        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
//    };
//}

// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

NowPlayingResponse nowPlayingResponseFromMap(String str) => NowPlayingResponse.fromMap(json.decode(str));

String nowPlayingResponseToMap(NowPlayingResponse data) => json.encode(data.toMap());

class NowPlayingResponse {
    NowPlayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "dates": dates.toMap(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap = Map.from();

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap;
        return reverseMap;
    }
}
