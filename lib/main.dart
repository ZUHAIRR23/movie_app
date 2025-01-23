import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/gallery_cubit.dart';
import 'package:movie_app/cubit/now_playing_cubit.dart';
import 'package:movie_app/cubit/popular_cubit.dart';
import 'package:movie_app/cubit/recommendation_cubit.dart';
import 'package:movie_app/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PopularCubit()),
        BlocProvider(create: (_) => NowPlayingCubit()),
        BlocProvider(create: (_) => GalleryCubit()),
        BlocProvider(create: (_) => RecommendationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutflix',
        home: HomePage(),
      ),
    );
  }
}
