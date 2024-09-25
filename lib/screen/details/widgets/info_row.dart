import 'package:flutter/material.dart';
import 'package:quadb_tech/model/movie_detail_model.dart';
import 'package:quadb_tech/utils/app_color.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.movie});

  final MovieDetailModel movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Year
        Text(
          movie.show!.premiered == null ? ' - - ' :
          movie.show!.premiered.toString().substring(0, 4),
          style: const TextStyle(
              fontSize: 18,
              color: Colors.white
          ),
        ),

        const SizedBox(width: 15),

        // Score
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: darkGreyColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            'Score ${movie.score == null ? '-' : (movie.score! * 100).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white
            ),
          ),
        ),

        const SizedBox(width: 15),

        // Country
        movie.show!.network != null ?
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: darkGreyColor.withOpacity(0.6),
              width: 1.5
            )
          ),
          child: Text(
            movie.show!.network!.country!.code.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white
            ),
          ),
        ) : const SizedBox(),
      ],
    );
  }
}
