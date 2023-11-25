import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/movie_list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Continue watching for User',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  MovieListCard(
                    isResumeable: true,
                  ),
                  MovieListCard(
                    isResumeable: true,
                  ),
                ],
              ),
              Text(
                'Recommended for You',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              MovieListCard(),
              Text(
                'Trending',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.abc_outlined), //TODO: NETFLIX con
          SizedBox(width: 18),
          GestureDetector(
            onTap: () => print('hel'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 260,
              height: 36,
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 15),
                  Text(
                    'Search',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 18),
          Icon(Icons.abc_outlined), //TODO: user icon
        ],
      ),
    );
  }
}