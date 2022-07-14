import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/text.dart';

class TopRated extends StatelessWidget {
  final List topRated;

  const TopRated({super.key, required this.topRated});
  
  final defaultUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(text: "Top Ratewd Movies", color: Colors.white, size: 26),
          SizedBox(height: 10,),
          //List view container
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: topRated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {},
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