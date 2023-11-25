import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/movie.model.dart';
import 'movie_card.dart';

class MovieCardsGrid extends StatelessWidget {
  const MovieCardsGrid({
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
        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: movieList.length,
            itemBuilder: (context, index) => MovieCard(
              movie: movieList[index],
              isResumeable: isResumeable,
            ),
          ),
        ),
      ],
    );
  }
}
