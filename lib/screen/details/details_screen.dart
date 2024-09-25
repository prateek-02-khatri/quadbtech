import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_tech/model/movie_detail_model.dart';
import 'package:quadb_tech/provider/app_provider.dart';
import 'package:quadb_tech/screen/details/widgets/episode_card.dart';
import 'package:quadb_tech/screen/details/widgets/info_row.dart';
import 'package:quadb_tech/screen/details/widgets/movie_name.dart';
import 'package:quadb_tech/screen/details/widgets/movie_preview.dart';
import 'package:quadb_tech/screen/details/widgets/custom_button.dart';
import 'package:quadb_tech/utils/app_color.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movie});

  final MovieDetailModel movie;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  late AppProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AppProvider>(context, listen: false);
    if (widget.movie.show!.lLinks!.previousepisode != null) {
      provider.getPreviousEpisode(widget.movie.show!.lLinks!.previousepisode!.href.toString());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: greyColor,
      body: SafeArea(
        child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider value, Widget? child) {

            return value.fetchingEpisode ?
            const Center(
              child: CircularProgressIndicator(
                color: darkRedColor,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MoviePreview(
                        imageUrl: widget.movie.show!.image == null ? '' : widget.movie.show!.image!.original.toString()
                    ),
                
                    const SizedBox(height: 5),
                
                    MovieName(movie: widget.movie),
                
                    const SizedBox(height: 5),
                
                    InfoRow(movie: widget.movie),
                
                    const SizedBox(height: 10),
                
                    SizedBox(
                      height: 25,
                      child: Center(
                        child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return const VerticalDivider(
                              color: darkGreyColor,
                              width: 15,
                              thickness: 2,
                            );
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.movie.show!.genres!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                widget.movie.show!.genres![index],
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: darkGreyColor
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                
                    const SizedBox(height: 15),
                
                    const CustomButton(
                      icon: Icons.play_arrow,
                      text: 'Play',
                      bgColor: Colors.white,
                      fgColor: Colors.black,
                    ),
                
                    const SizedBox(height: 10),
                
                    const CustomButton(
                      icon: Icons.download_sharp,
                      text: 'Download',
                      bgColor: Colors.white30,
                      fgColor: Colors.white,
                    ),
                
                    const SizedBox(height: 10),
                
                    Text(
                      widget.movie.show!.summary.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ''),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                
                    const SizedBox(height: 20),
                
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _customColumn(Icons.add, 'My List', 35),
                        _customColumn(Icons.thumb_up_alt_outlined, 'Rate', 30),
                        _customColumn(Icons.send, 'Recommend', 30),
                        const SizedBox(width: 80),
                      ],
                    ),
                
                    const SizedBox(height: 25),

                    if (widget.movie.show!.lLinks!.previousepisode != null)
                      EpisodeCard(previousEpisode: value.previousEpisode)

                  ],
                ),
              ),
            );
          },
        ),
      )
    );
  }

  Widget _customColumn(IconData icon, String text, double size) {
    return SizedBox(
      height: 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: size,
            color: Colors.white,
          ),

          Text(
            text,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
