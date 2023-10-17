import 'package:flutter/material.dart';
import 'package:study_api_flutter/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  const MovieDetail({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String path = imgPath + movie.posterPath;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  movie.overview,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
