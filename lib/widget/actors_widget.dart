import 'package:flutter/cupertino.dart';
import 'package:movie_app/model/credits.dart';

class ActorsWidget extends StatelessWidget {
  const ActorsWidget({super.key, required this.movie});

  final CreditsMovie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage("https://image.tmdb.org/t/p/original/${movie}"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
