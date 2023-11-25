import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/movie.model.dart';
import '../../movie_details/movie_details.page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    this.isResumeable = false,
    required this.movie,
  });

  final bool isResumeable;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movie: movie),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                movie.image?.medium ?? '',
              ),
            ),
          ),
          width: 107,
          height: 160,
          child: Stack(
            children: [
              movie.image?.medium == null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movie.name,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                    )
                  : SizedBox(),
              isResumeable ? _playButton() : SizedBox(),
            ],
          )),
    );
  }

  Center _playButton() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.6),
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        width: 60,
        height: 60,
        child: Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}
