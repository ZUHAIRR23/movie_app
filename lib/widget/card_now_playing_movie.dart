import 'package:flutter/cupertino.dart';
import 'package:movie_app/shared/themes.dart';

class CardNowPlayingMovie extends StatelessWidget {
  const CardNowPlayingMovie({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image:
                NetworkImage("https://image.tmdb.org/t/p/original/$image"),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            name,
            style: description.copyWith(fontWeight: FontWeight.w100),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}