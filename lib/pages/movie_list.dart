import 'package:flutter/material.dart';
import 'package:study_api_flutter/pages/movie_detail.dart';
import 'package:study_api_flutter/service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ${movies[position].voteAverage}',
              ),
              onTap: (){
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movies[position]
                    ),
                    );
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}
