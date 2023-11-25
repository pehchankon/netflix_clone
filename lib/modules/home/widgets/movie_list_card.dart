import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieListCard extends StatelessWidget {
  const MovieListCard({
    super.key,
    this.isResumeable = false,
  });

  final bool isResumeable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('movie tap'),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://static.tvmaze.com/uploads/images/medium_portrait/425/1064746.jpg'),
          ),
        ),
        width: 107,
        height: 163,
        child: Stack(
          children: [
            // Image.network(
            //     'https://static.tvmaze.com/uploads/images/medium_portrait/425/1064746.jpg'),
            isResumeable ? _playButton() : SizedBox(),
          ],
        ),
      ),
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
