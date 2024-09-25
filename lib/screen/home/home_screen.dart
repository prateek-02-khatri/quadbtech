import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_tech/provider/app_provider.dart';
import 'package:quadb_tech/screen/details/details_screen.dart';
import 'package:quadb_tech/components/custom_search_bar.dart';
import 'package:quadb_tech/utils/app_color.dart';

import '../../components/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider value, Widget? child) {
        value.getMovieList();
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 55,
              title: CustomSearchBar(
                onTap: () {
                  value.setCurrentScreen(1);
                },
                onChanged: (string) {},
                enabled: false,
              ),
            ),

            body:value.fetching ?
            const Center(
              child: CircularProgressIndicator(
                color: darkRedColor,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: value.movies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DetailsScreen(
                              movie: value.movies[index],
                            ))
                          );
                        },
                        child: MovieCard(
                          movie: value.movies[index]
                        )
                    );
                  }
              ),
            )
        );
      },
    );
  }
}