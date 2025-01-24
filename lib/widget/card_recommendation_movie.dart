import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/recommendation_movie.dart';
import 'package:movie_app/shared/themes.dart';
import 'package:movie_app/ui/detail_page.dart';

class CardRecommendationMovie extends StatelessWidget {
  const CardRecommendationMovie({
    super.key,
    required this.movie,
  });

  final RecommendationMovie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(movie: movie),
          ),
        );
      },
      child: Container(
        height: 250,
        width: 150,
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/original/${movie.poster}"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              movie.title!,
              style: description.copyWith(fontWeight: FontWeight.w100),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
