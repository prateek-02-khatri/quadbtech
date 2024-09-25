import 'package:flutter/material.dart';

class MoviePreview extends StatelessWidget {
  const MoviePreview({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Image
        imageUrl == '' ?
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height * 0.23,
          color: Colors.black,
        ) :
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.23,
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Play Button
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(10),
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
              size: 45,
            ),
          ),
        ),

        // Close Button
        Positioned(
          top: 0,
          right: 6,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: _customButton(
              Icons.close,
              35
            ),
          )
        ),

        // Casting Button
        Positioned(
          top: 0,
          right: 65,
          child: _customButton(
            Icons.cast,
            25
          )
        ),

        // Mute Button
        Positioned(
          bottom: 10,
          right: 5,
          child: _customButton(
            Icons.volume_off,
            20
          )
        )
      ],
    );
  }

  Widget _customButton(IconData icon, double size) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: size
      ),
    );
  }
}
