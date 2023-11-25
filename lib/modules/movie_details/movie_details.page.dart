import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/models/movie.model.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close),
            ),
          ),
        ],
        // title: _blurredPosterBackground(true),
        // flexibleSpace:
        //     FlexibleSpaceBar(background: _blurredPosterBackground(true), ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            _blurredPosterBackground(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 200,
                      child: Image.network(movie.image?.original ?? ''),
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    movie.name,
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  Html(
                    data: movie.summary ?? '',
                    style: {
                      'body': Style(
                        fontSize: FontSize(16.0),
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        // fontFamily:
                      ),
                    },
                  ),
                  SizedBox(height: 40),
                  PlayButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blurredPosterBackground() {
    return SizedBox(
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -2),
            child: Transform.scale(
              scale: 1,
              child: Image.network(
                movie.image?.original ?? '',
              ),
            ),
          ),
          Container(
            // height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEE1520),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            'Play',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
