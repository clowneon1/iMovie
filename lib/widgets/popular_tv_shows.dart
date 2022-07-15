import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imovie/util/text.dart';

import '../description.dart';

class PopularTvShows extends StatelessWidget {

  final List shows;  

  final defaultUrl = "https://image.tmdb.org/t/p/w500";

  const PopularTvShows({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Popular TV Shows", color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          //list view container
          Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shows.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                    builder: ((context) =>
                      Description(name: shows[index]["name"] != null ? shows[index]["name"] : "Not Loading", 
                      description: shows[index]["overview"] != null ? shows[index]["overview"] : "Not Loading", 
                      bannerUrl: shows[index]["backdrop_path"] != null ? shows[index]["backdrop_path"] : "default", 
                      posterUrl: shows[index]["poster_path"] != null ? shows[index]["poster_path"] : "default", 
                      vote: shows[index]["vote_average"] != null ? shows[index]["vote_average"] * 1.0 : 0.0, 
                      launchOn: shows[index]["release_date"] != null ? shows[index]["release_date"] : "N/A")
                    )));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: 250,
                    child: Column(
                      children: [
                        // Poster
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                defaultUrl + (shows[index]["backdrop_path"] != null ? shows[index]["backdrop_path"] : shows[index]["poster_path"]), 
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        //Text
                        Container(
                          child: Text(shows[index]?["name"] != null ? shows[index]["name"] : "loading",
                            style: GoogleFonts.breeSerif(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
