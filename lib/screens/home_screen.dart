import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/style/theme.dart' as Style;
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
      backgroundColor: Style.Colors.mainColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Flutter Movie App"),
        leading: Icon(EvaIcons.menuOutline),
        actions: <Widget>[
          IconButton(icon: Icon(EvaIcons.searchOutline, color: Colors.white), onPressed: null)
        ],
        elevation: 0
      ),
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