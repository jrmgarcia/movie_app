import 'package:flutter/material.dart';
import 'package:movie_app/bloc/get_movies_byGenre_bloc.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/widgets/genre_movies.dart';

class GenresList extends StatefulWidget {
  final List<Genre> genres;
  GenresList({Key key, @required this.genres}) : super(key: key);
  @override
  _GenresListState createState() => _GenresListState(genres);
}

class _GenresListState extends State<GenresList>
    with SingleTickerProviderStateMixin {
  final List<Genre> genres;
  _GenresListState(this.genres);
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: genres.length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        moviesByGenreBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300.0,
        child: DefaultTabController(
          length: genres.length,
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Theme.of(context).accentColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3.0,
                  unselectedLabelColor:
                      Theme.of(context).accentColor.withOpacity(0.5),
                  labelColor: Colors.white,
                  isScrollable: true,
                  tabs: genres.map((Genre genre) {
                    return Container(
                        padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                        child: Text(genre.name.toUpperCase(),
                            style: Theme.of(context).textTheme.subtitle2));
                  }).toList(),
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: genres.map((Genre genre) {
                return GenreMovies(
                  genreId: genre.id,
                );
              }).toList(),
            ),
          ),
        ));
  }
}
