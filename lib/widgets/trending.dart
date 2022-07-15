import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imovie/description.dart';
import 'package:imovie/util/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  final defaultUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Trending Movies", color: Colors.white, size: 26),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: ((context) =>
                      Description(name: trending[index]["title"] != null ? trending[index]["title"] : "Not Loading", 
                      description: trending[index]["overview"] != null ? trending[index]["overview"] : "Not Loading", 
                      bannerUrl: trending[index]["backdrop_path"] != null ? trending[index]["backdrop_path"] : "default", 
                      posterUrl: trending[index]["poster_path"] != null ? trending[index]["poster_path"] : "default", 
                      vote: trending[index]["vote_average"] != null ? trending[index]["vote_average"] : 0.0, 
                      launchOn: trending[index]["release_date"] != null ? trending[index]["release_date"] : "N/A")
                    )));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              defaultUrl + (trending[index]["poster_path"] != null ? trending[index]["poster_path"] : trending[index]["backdrop_path"]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: Text(trending[index]["title"] != null ? trending[index]["title"] : "loading",
                          style: GoogleFonts.breeSerif(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            })),
          ),
        ],
      ),
    );
  }
}
