import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_search_bar.dart';
import '../../components/movie_card.dart';
import '../../provider/app_provider.dart';
import '../../utils/app_color.dart';
import '../details/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider value, Widget? child) {
        value.getMovieList();
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 50,
              title: CustomSearchBar(
                onTap: () {},
                onChanged: (string) {
                  value.getSearchedMovieList(string);
                  setState(() {});
                },
              ),
            ),
            body: value.fetchingSearchedMovie
                ? const Center(
                    child: CircularProgressIndicator(
                      color: darkRedColor,
                    ),
                  )
                : value.searchedMovies.isEmpty
                    ? const Center(
                        child: Text(
                          'No show found..!!',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: value.searchedMovies.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailsScreen(
                                                  movie: value
                                                      .searchedMovies[index],
                                                )));
                                  },
                                  child: MovieCard(
                                      movie: value.searchedMovies[index]));
                            }),
                      ));
      },
    );
  }
}
