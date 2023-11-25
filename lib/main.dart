import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/data/apiClient.dart';
import 'package:netflix_clone/data/movieRepository.dart';
import 'constants.dart';
import 'modules/home/home.scaffold.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  final apiClient = ApiClient(kBaseAPIUrl);
  final movieRepository = MovieRepository(apiClient);

  runApp(
    RepositoryProvider<MovieRepository>.value(
      value: movieRepository,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final String title = 'title';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black.withOpacity(0.6),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
            unselectedLabelStyle: GoogleFonts.poppins(fontSize: 14),
          ),
        ),
        home: HomeScaffold(),
      );
}
