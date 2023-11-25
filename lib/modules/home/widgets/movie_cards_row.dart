import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/movie.model.dart';
import 'movie_card.dart';

class MovieCardsRow extends StatelessWidget {
  const MovieCardsRow({
    super.key,
    required this.movieList,
    required this.title,
    this.isResumeable = false,
  });

  final List<Movie> movieList;
  final bool isResumeable;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: movieList.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 8,
                right: index == movieList.length ? 0 : 8,
              ),
              child: MovieCard(
                movie: movieList[index],
                isResumeable: isResumeable,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
