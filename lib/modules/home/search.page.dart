import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/data/movieRepository.dart';

import '../../models/movie.model.dart';
import '../common/loader.widget.dart';
import 'widgets/movie_cards_grid.dart';
import 'widgets/movie_cards_row.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.textController,
  });
  final TextEditingController textController;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> searchResults = [];
  bool isLoading = false;
  late MovieRepository movieRepository;

  void _searchEvents() async {
    setState(() => isLoading = true);
    final fetchedEvents =
        await movieRepository.searchMovies(widget.textController.text);
    setState(() => searchResults = fetchedEvents);
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    movieRepository = RepositoryProvider.of<MovieRepository>(context);
    widget.textController.addListener(_searchEvents);
    super.initState();
  }

  @override
  void dispose() {
    widget.textController.removeListener(_searchEvents);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loader()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: widget.textController.text.isEmpty
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                widget.textController.text.isEmpty
                    ? Center(
                        child: Text(
                          'Type something to search',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Expanded(
                        child: MovieCardsGrid(
                          title: 'Search Results',
                          movieList: searchResults,
                        ),
                      ),
              ],
            ),
          );
  }
}
