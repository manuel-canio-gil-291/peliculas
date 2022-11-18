
//class Movie {
//    Movie({
//        required this.adult,
//        this.backdropPath,
//        required this.genreIds,
//        required this.id,
//        this.originalLanguage,
//        required this.originalTitle,
//        required this.overview,
//        required this.popularity,
//        this.posterPath,
//        this.releaseDate,
//        required this.title,
//        required this.video,
//        required this.voteAverage,
//        required this.voteCount,
//    });
//
//    bool adult;
//    String? backdropPath;
//    List<int> genreIds;
//    int id;
//    String? originalLanguage;
//    String originalTitle;
//    String overview;
//    double popularity;
//    String? posterPath;
//    String? releaseDate;
//    String title;
//    bool video;
//    double voteAverage;
//    int voteCount;
//
//    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
//        adult: json["adult"],
//        backdropPath: json["backdrop_path"],
//        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//        id: json["id"],
//        originalLanguage: json["original_language"],
//        originalTitle: json["original_title"],
//        overview: json["overview"],
//        popularity: json["popularity"].toDouble(),
//        posterPath: json["poster_path"],
//        releaseDate: json["release_date"],
//        title: json["title"],
//        video: json["video"],
//        voteAverage: json["vote_average"].toDouble(),
//        voteCount: json["vote_count"],
//    );
//
//    Map<String, dynamic> toMap() => {
//        "adult": adult,
//        "backdrop_path": backdropPath,
//        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//        "id": id,
//        "original_language": originalLanguage,
//        "original_title": originalTitle,
//        "overview": overview,
//        "popularity": popularity,
//        "poster_path": posterPath,
//        "release_date": releaseDate,
//        "title": title,
//        "video": video,
//        "vote_average": voteAverage,
//        "vote_count": voteCount,
//    };
//}
//
//enum OriginalLanguage { EN, DE, JA, ES }


import 'dart:convert';

class Movie {
    Movie({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        required this.releaseDate,
        required this.title,
        required this.video,
        this.voteAverage,
        required this.voteCount,
    });

    bool adult;
    String backdropPath;
    String genreIds;
    int id;
    String? originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    DateTime releaseDate;
    String title;
    bool video;
    double? voteAverage;
    int voteCount;

    factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

    get FullPosterImg {
      if(posterPath != null) {
        return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
      }

      return 'https://i.stack.imgur.com/GNhx0.png';
    }

    get FullBackdropPath {
      if(posterPath != null) {
        return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';
      }

      return 'https://i.stack.imgur.com/GNhx0.png';
    }

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"],
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginalLanguage { EN, DE, JA, ES }

//final originalLanguageValues = EnumValues({
//    "de": OriginalLanguage.DE,
//    "en": OriginalLanguage.EN,
//    "es": OriginalLanguage.ES,
//    "ja": OriginalLanguage.JA
//});