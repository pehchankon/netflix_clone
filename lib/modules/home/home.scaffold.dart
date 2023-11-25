
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/constants.dart';
import 'home.page.dart';
import 'search.page.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 0;
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(_textController),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _textController.clear();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
      ),
      body: _currentIndex == 0
          ? HomePage()
          : SearchPage(
              textController: _textController,
            ),
    );
  }

  AppBar _appBar(TextEditingController _textController) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kNetflixLogoIcon, width: 40),
          SizedBox(width: 18),
          GestureDetector(
            onTap: () => setState(() => _currentIndex = 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              width: 260,
              height: 36,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: TextField(
                      onTap: () => setState(() => _currentIndex = 1),
                      controller: _textController,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.7),
                          height: 1.2,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Text(
                  //   'Search',
                  //   style: GoogleFonts.poppins(fontSize: 16),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(width: 18),
          Image.asset(kAvatar, width: 20)
        ],
      ),
    );
  }
}
