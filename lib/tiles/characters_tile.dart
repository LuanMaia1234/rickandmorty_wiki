import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortywiki/screens/character_screen.dart';
import 'package:rickandmortywiki/stores/character_store.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterTile extends StatelessWidget {
  final character;

  CharacterTile(this.character);

  @override
  Widget build(BuildContext context) {
    final _characterStore = Provider.of<CharacterStore>(context, listen: false);

    return GestureDetector(
      child: Observer(
        builder: (_) {
          return Container(
            margin: EdgeInsets.all(20),
            width: 300,
            decoration: _characterStore.carouselLoaded
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15,
                      )
                    ],
                  )
                : null,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: character['id'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: character['image'],
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height - 200),
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _characterStore.carouselLoaded ? character['name'] : '',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      onTap: () {
        //        Text(character['name'],textAlign: TextAlign.left,style: TextStyle(color: Colors.black),),
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CharacterScreen(character)));
      },
    );
  }
}
