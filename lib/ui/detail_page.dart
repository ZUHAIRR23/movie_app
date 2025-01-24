import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/details_cubit.dart';
import 'package:movie_app/cubit/gallery_cubit.dart';
import 'package:movie_app/cubit/recommendation_cubit.dart';
import 'package:movie_app/model/details_movie.dart';
import 'package:movie_app/model/gallery.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/recommendation_movie.dart';
import 'package:movie_app/widget/card_recommendation_movie.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<GalleryCubit>().getGallery(widget.movie.id!);
    context.read<RecommendationCubit>().getRecommendationMovie(widget.movie.id!);
    context.read<DetailsCubit>().getDetailsMovie(widget.movie.id!);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/original/${widget.movie.image}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Container(
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 25,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${widget.movie.poster}",
                            width: 120,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 25,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          print('Play button pressed');
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Play',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.movie.title!,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ReadMoreText(
                    widget.movie.overview!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimLines: 3,
                    colorClickableText: Colors.red,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BlocBuilder<DetailsCubit, DetailsState>(
                        builder: (_, state) {
                          if (state is DetailsMovieLoaded) {
                            DetailsMovie movie = state.detailsMovie;
                            return Column(
                              children: [
                                const Icon(Icons.language, color: Colors.white),
                                const SizedBox(height: 4),
                                Text(
                                  "${movie.originalLanguage}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.white70,
                                      ),
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              child: Text("NTTTT"),
                            );
                          }
                        },
                      ),
                      BlocBuilder<DetailsCubit, DetailsState>(
                        builder: (_, state) {
                          if (state is DetailsMovieLoaded) {
                            DetailsMovie movie = state.detailsMovie;
                            return Column(
                              children: [
                                const Icon(Icons.timelapse, color: Colors.white),
                                const SizedBox(height: 4),
                                Text(
                                  "${movie.status}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container(
                              child: Text("NTTTT"),
                            );
                          }
                        },
                      ),
                      Column(
                        children: [
                          const Icon(Icons.schedule, color: Colors.white),
                          const SizedBox(height: 4),
                          Text(
                            "${widget.movie.release}",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white70,
                                    ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.star, color: Colors.red),
                          const SizedBox(height: 4),
                          Text(
                            "${widget.movie.rating}",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white70,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                BlocBuilder<GalleryCubit, GalleryState>(builder: (_, state) {
                  if (state is GalleryLoaded) {
                    Gallery movie = state.gallery;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: movie.backdrops
                                .take(7)
                                .map(
                                  (e) => Container(
                                    height: 185,
                                    width: 350,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 350,
                                          height: 185,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://image.tmdb.org/t/p/w500/${e.filePath}"),
                                              fit: BoxFit.fitWidth,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList() +
                            [],
                      ),
                    );
                  } else {
                    return Container(
                      child: Text("NTTTT"),
                    );
                  }
                }),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recommendations',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: BlocBuilder<RecommendationCubit,
                            RecommendationState>(builder: (_, state) {
                          if (state is RecommendationMovieLoaded) {
                            List<RecommendationMovie> movie =
                                state.recommendationMovie;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: movie
                                        .take(7)
                                        .map(
                                          (e) => CardRecommendationMovie(
                                            movie: e,
                                          ),
                                        )
                                        .toList() +
                                    [],
                              ),
                            );
                          } else {
                            return Container(
                              child: Text("NTTTT"),
                            );
                          }
                        }),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
