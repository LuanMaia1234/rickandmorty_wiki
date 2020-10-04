import 'package:flutter/material.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';

class DataSearch extends SearchDelegate {
  RickAndMortyApi _rickAndMortyApi;

  DataSearch() {
    _rickAndMortyApi = RickAndMortyApi();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: theme.primaryTextTheme.title.color)),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme,
        textTheme: theme.textTheme.copyWith(
            title: theme.textTheme.title
                .copyWith(color: theme.primaryTextTheme.title.color)));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search must be longer than two letters.",
            ),
          )
        ],
      );
    }
    return FutureBuilder(
      future: _rickAndMortyApi.getCharacters(search: query),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.green),),
          );
        } else if (snapshot.data.length == 0) {
          return Center(
            child: Text(
              "No Results Found.",
            ),
          );
        } else {
          return ListView.separated(
              itemCount: snapshot.data['results'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data['results'][index]['name']),
                  onTap: () {
                    close(context, snapshot.data['results'][index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              });
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }
}
