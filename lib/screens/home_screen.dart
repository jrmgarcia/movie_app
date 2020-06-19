import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/bloc/get_genres_bloc.dart';
import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/widgets/genres.dart';
import 'package:movie_app/widgets/now_playing.dart';
import 'package:movie_app/widgets/persons.dart';
import 'package:movie_app/widgets/toprated_movies.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text("Discover"),
          actions: <Widget>[
            IconButton(
                icon: Icon(EvaIcons.searchOutline,
                    color: Theme.of(context).accentColor),
                onPressed: null)
          ],
          elevation: 0),
      drawer: Drawer(
          child: StreamBuilder<GenreResponse>(
        stream: genresBloc.subject.stream,
        builder: (context, AsyncSnapshot<GenreResponse> snapshot) {
          var genres = snapshot.data.genres;
          return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    genres[index].name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              });
        },
      )),
      body: ListView(
        children: <Widget>[
          NowPlaying(),
          GenresScreen(),
          PersonsList(),
          TopRatedMovies()
        ],
      ),
    );
  }
}
