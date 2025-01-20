import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/now_playing_cubit.dart';
import 'package:movie_app/cubit/popular_cubit.dart';
import 'package:movie_app/model/now_playing_movie.dart';
import 'package:movie_app/model/popular_movie.dart';
import 'package:movie_app/widget/card_now_playing_movie.dart';
import '../widget/card_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PopularCubit>().getPopularMovie();
    context.read<NowPlayingCubit>().getNowPlayingMovie();
    super.initState();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        title: const Text(
          'Flutflix',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          const SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Shows',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Popular',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: BlocBuilder<PopularCubit, PopularState>(
                        builder: (_, state) {
                      if (state is PopularMovieLoaded) {
                        List<PopularMovie> movie = state.popularMovie;

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: movie
                                    .take(7)
                                    .map((e) => CardMovie(
                                        name: e.title!, image: e.image!))
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
            const SizedBox(height: 20),
            const Text(
              'Now Playing',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
                        builder: (_, state) {
                      if (state is NowPlayingMovieLoaded) {
                        List<NowPlayingMovie> movie = state.nowPlayingMovie;

                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: movie
                                    .take(7)
                                    .map((e) => CardNowPlayingMovie(
                                        name: e.title!, image: e.image!))
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
    );
  }
}
