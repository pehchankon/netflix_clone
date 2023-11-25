import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/data/movieRepository.dart';

import '../../models/movie.model.dart';
import '../common/loader.widget.dart';
import 'widgets/movie_cards_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Movie> continueWatchingMovies;
  late List<Movie> recommendedMovies;
  late List<Movie> movies;
  bool isLoading = true;
  late MovieRepository movieRepository;

  @override
  void initState() {
    movieRepository = RepositoryProvider.of<MovieRepository>(context);
    _init();
    super.initState();
  }

  _init() async {
    movies = await movieRepository.fetchAllMovies();
    // print(movies);
    recommendedMovies = _pickRandomMovies();
    continueWatchingMovies = _pickRandomMovies();
    setState(() => isLoading = false);
  }

  List<Movie> _pickRandomMovies() {
    Set<Movie> _uniqueMovies = Set();
    final _random = new Random();
    for (int i = 0; i < 5; i++) {
      final _randomIndex = _random.nextInt(movies.length);
      _uniqueMovies.add(movies[_randomIndex]);
    }
    return _uniqueMovies.toList();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loader()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  MovieCardsRow(
                    title: 'Continue watching',
                    movieList: continueWatchingMovies,
                    isResumeable: true,
                  ),
                  SizedBox(height: 30),
                  MovieCardsRow(
                    title: 'Recommended for You',
                    movieList: recommendedMovies,
                  ),
                  SizedBox(height: 30),
                  MovieCardsRow(
                    title: 'Trending',
                    movieList: movies,
                  ),
                ],
              ),
            ),
          );
  }
}
