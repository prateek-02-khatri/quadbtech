import 'package:flutter/material.dart';
import 'package:quadb_tech/model/movie_detail_model.dart';

class MovieName extends StatelessWidget {
  const MovieName({super.key, required this.movie});

  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            child: Text(
              movie.show!.name.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ),

        movie.show!.rating!.average != null ?
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star,
              size: 24,
              color: Colors.yellow,
            ),

            const SizedBox(width: 8),

            Text(
              movie.show!.rating!.average.toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ],
        ) : const SizedBox(width: 40,)
      ],
    );
  }
}
