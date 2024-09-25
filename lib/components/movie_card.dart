import 'package:flutter/material.dart';

import '../model/movie_detail_model.dart';
import '../utils/app_color.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(3),
      child: Card(
        color: greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Image
              movie.show!.image == null ?
              Container(
                width: 100,
                height: MediaQuery.of(context).size.height * 0.2 - 10,
                color: Colors.black,
              ) :
              SizedBox(
                width: 100,
                height: MediaQuery.of(context).size.height * 0.2 - 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movie.show!.image!.original.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    // Movie Name and Rating
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 175,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 230,
                            child: Text(
                              movie.show!.name.toString(),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),

                          _ratingCard()
                        ],
                      ),
                    ),

                    // Summary
                    movie.show!.summary == null ? const SizedBox() :
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 175,
                        child: Text(
                          movie.show!.summary.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: darkGreyColor,
                          ),
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingCard() {
    return movie.show!.rating!.average != null ?
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star,
          size: 18,
          color: Colors.yellow,
        ),

        const SizedBox(width: 5),

        Text(
          movie.show!.rating!.average.toString(),
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ],
    ) : const SizedBox(width: 40,);
  }
}