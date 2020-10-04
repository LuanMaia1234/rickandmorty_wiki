import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortywiki/screens/home_screen.dart';
import 'package:rickandmortywiki/stores/character_store.dart';

void main() => runApp(RickAndMortyApp());

class RickAndMortyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<CharacterStore>(
      create: (_) => CharacterStore(),
      child: MaterialApp(
        title: 'Rick and Morty Wiki',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
