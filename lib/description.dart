import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imovie/util/text.dart';

class Description extends StatelessWidget {
  final defaultUrl = "https://image.tmdb.org/t/p/w500";
  final String name, description, bannerUrl, posterUrl, launchOn;
  final double vote;

  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchOn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        defaultUrl + (bannerUrl != "default" ? bannerUrl : posterUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: "⭐ Rating: " + vote.toString(),
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: name,
                color: Colors.white,
                size: 24,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: "Release date: " + launchOn, color: Colors.white, size: 14),
            ),

            SizedBox(height: 10,),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(defaultUrl + posterUrl),
                ),

                Flexible(
                  child: Container(
                    child: ModifiedText(text: description, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
