import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../description.dart';
import '../util/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({super.key, required this.topRated});
  
  final defaultUrl = "https://image.tmdb.org/t/p/w500";

  // @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Top Rated Movies", color: Colors.white, size: 26),
          SizedBox(height: 10,),
          //List view container
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: topRated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                    builder: ((context) =>
                      Description(name: topRated[index]["title"] != null ? topRated[index]["title"] : "Not Loading", 
                      description: topRated[index]["overview"] != null ? topRated[index]["overview"] : "Not Loading", 
                      bannerUrl: topRated[index]["backdrop_path"] != null ? topRated[index]["backdrop_path"] : "default", 
                      posterUrl: topRated[index]["poster_path"] != null ? topRated[index]["poster_path"] : "default", 
                      vote: topRated[index]["vote_average"] != null ? topRated[index]["vote_average"] : 0.0, 
                      launchOn: topRated[index]["release_date"] != null ? topRated[index]["release_date"] : "N/A")
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
                                defaultUrl + topRated[index]["poster_path"],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          child: Text(topRated[index]["title"] != null ? topRated[index]["title"] : "loading",
                            style: GoogleFonts.breeSerif(),
                          ),
                        ),
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