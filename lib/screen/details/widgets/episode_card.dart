import 'package:flutter/material.dart';
import 'package:quadb_tech/model/previous_episode_model.dart';

import '../../../utils/app_color.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({super.key, required this.previousEpisode});

  final PreviousEpisodeModel previousEpisode;

  @override
  Widget build(BuildContext context) {
    double imageWidth = MediaQuery.of(context).size.width * 0.22;
    return  Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: redColor,
                        width: 2,
                      )
                  )
              ),
              child: const Text(
                'Episodes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(width: 30),

            const Text(
              'More Like This',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: darkGreyColor,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        Row(
          children: [
            previousEpisode.image != null ?
            SizedBox(
              width: imageWidth,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      previousEpisode.image!['medium'].toString(),
                    ),
                  ),

                  Container(
                    width: imageWidth/3,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                        border: const Border.fromBorderSide(
                            BorderSide(
                                color: Colors.white,
                                width: 0.5
                            )
                        )
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ) :
            Container(
              width: imageWidth,
              height: imageWidth / 2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(width: 15),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - imageWidth - 100,
                  child: Text(
                    previousEpisode.name.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: darkGreyColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),

                const SizedBox(width: 5),

                Text(
                  previousEpisode.airtime.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white30,
                  ),
                )
              ],
            ),

            const Spacer(),

            Icon(
              Icons.download,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),

        const SizedBox(height: 10),

        previousEpisode.summary == null ? const SizedBox() :
        Text(
          previousEpisode.summary.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
          textAlign: TextAlign.justify,
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
