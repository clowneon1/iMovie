import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imovie/Auth/Access.dart';
import 'package:imovie/util/text.dart';
import 'package:imovie/widgets/popular_tv_shows.dart';
import 'package:imovie/widgets/top_rated.dart';
import 'package:imovie/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'model/movie.dart';

void main() => runApp(new IMovie());

class IMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  Access auth = Access();

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    //init TMDB object which takes apikey and access token
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(auth.apiKey, auth.readAccessToken),
      //Log configuration for keeping track of activity.
      // ignore: prefer_const_constructors
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    //getting dictionary / Map of trending movies i.e. key value pair
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    //getting dictionary / Map of top rated movies i.e. key value pair
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    //getting dictionary / Map of popular tv shows i.e. key value pair
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult["results"];
      topRatedMovies = topRatedResult["results"];
      tv = tvResult["results"];
    });
    //print(trendingMovies[0].overview);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iMovie",
        style: GoogleFonts.breeSerif() , 
        ),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        children: [
          PopularTvShows(shows: tv),
          TrendingMovies(trending: trendingMovies),
          TopRated(topRated: topRatedMovies),
        ],
      ),
    );
  }
}
