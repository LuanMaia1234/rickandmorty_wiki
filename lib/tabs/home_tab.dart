import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortywiki/stores/character_store.dart';
import 'package:rickandmortywiki/tiles/characters_tile.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _characterStore = Provider.of<CharacterStore>(context, listen: false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Observer(
          builder: (_) {
            if (_characterStore.state == CharacterState.initial) {
              return Container();
            } else if (_characterStore.state == CharacterState.loading) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
              );
            } else {
              return CarouselSlider.builder(
                itemCount: _characterStore.charactersLength,
                itemBuilder: (context, index) {
                  return CharacterTile(
                      _characterStore.characterFuture.result['results'][index]);
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height - 200,
                  reverse: false,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    _characterStore.setCurrentImage(index);
                  },
                ),
              );
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) {
            if (_characterStore.state == CharacterState.initial) {
              return Container();
            } else if (_characterStore.state == CharacterState.loading) {
              return Container();
            } else {
              List<Widget> dotsList = [];
              for (int  i = 0; i < _characterStore.charactersLength; i++) {
                dotsList.add(Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _characterStore.currentImage == i
                        ? Colors.white
                        : Colors.grey[400],
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dotsList,
              );
            }
          },
        ),
      ],
    );
  }
}
