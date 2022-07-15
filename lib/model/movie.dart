// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tmdb_api/tmdb_api.dart';

class MoviesList {
  final List<Movie> movies;
  MoviesList({
    required this.movies,
  });

  MoviesList copyWith({
    List<Movie>? movies,
  }) {
    return MoviesList(
      movies: movies ?? this.movies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'movies': movies.map((x) => x.toMap()).toList(),
    };
  }

  factory MoviesList.fromMap(Map<String, dynamic> map) {
    return MoviesList(
      movies: List<Movie>.from((map['movies'] as List<int>).map<Movie>((x) => Movie.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesList.fromJson(String source) => MoviesList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MoviesList(movies: $movies)';

  @override
  bool operator ==(covariant MoviesList other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.movies, movies);
  }

  @override
  int get hashCode => movies.hashCode;
}

//Movie json to obj
class Movie {
  final String title; 
  final String overview; 
  final String backdrop_path;
  final String poster_path;
  final String release_date;
  final double vote_average;

  Movie({
    required this.title,
    required this.overview,
    required this.backdrop_path,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });
  
  

  Movie copyWith({
    String? title,
    String? overview,
    String? backdrop_path,
    String? poster_path,
    String? release_date,
    double? vote_average,
  }) {
    return Movie(
      title: title ?? this.title,
      overview: overview ?? this.overview,
      backdrop_path: backdrop_path ?? this.backdrop_path,
      poster_path: poster_path ?? this.poster_path,
      release_date: release_date ?? this.release_date,
      vote_average: vote_average ?? this.vote_average,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'overview': overview,
      'backdrop_path': backdrop_path,
      'poster_path': poster_path,
      'release_date': release_date,
      'vote_average': vote_average,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      overview: map['overview'] as String,
      backdrop_path: map['backdrop_path'] as String,
      poster_path: map['poster_path'] as String,
      release_date: map['release_date'] as String,
      vote_average: map['vote_average'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(title: $title, overview: $overview, backdrop_path: $backdrop_path, poster_path: $poster_path, release_date: $release_date, vote_average: $vote_average)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.overview == overview &&
      other.backdrop_path == backdrop_path &&
      other.poster_path == poster_path &&
      other.release_date == release_date &&
      other.vote_average == vote_average;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      overview.hashCode ^
      backdrop_path.hashCode ^
      poster_path.hashCode ^
      release_date.hashCode ^
      vote_average.hashCode;
  }
}
