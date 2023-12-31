import 'package:flutter/material.dart';
import 'movie.dart';

// ignore: must_be_immutable
class MovieDetail extends StatelessWidget {
  late Movie movie;
  late String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath!;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(16),
                  height: height / 1.5,
                  child: Image.network(path)),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(movie.overview),
              )
            ],
          ),
        ),
      ),
    );
  }
}
