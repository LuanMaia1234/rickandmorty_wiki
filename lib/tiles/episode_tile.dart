import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmortywiki/helpers/utils.dart';
import 'package:rickandmortywiki/screens/character_screen.dart';
import 'package:rickandmortywiki/stores/episode_store.dart';

class EpisodeTile extends StatelessWidget {
  final _episode;

  EpisodeTile(this._episode);

  final EpisodeStore _episodeStore = EpisodeStore();
  final Utils _utils = Utils();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ExpansionTile(
          title: Text('${_episode['name']} (${_episode['episode']})'),
          subtitle: Text(
            _episode['air_date'],
            style: TextStyle(fontSize: 10),
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 2, bottom: 3, left: 3),
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      if (_episodeStore.characterState ==
                          EpisodeState.initial) {
                        return Container();
                      } else if (_episodeStore.characterState ==
                          EpisodeState.loading) {
                        return Center(
                            child: Container(
                          padding: EdgeInsets.all(10),
                          child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green)),
                        ));
                      } else {
                        return ListView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount:_episodeStore.charactersFuture.result.length,
                            itemBuilder: (_, index) {
                              var character = _episodeStore
                                  .charactersFuture.result[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      NetworkImage(character['image']),
                                  child: Hero(
                                      tag: character['id'],
                                      child: Image.network(
                                        character['image'],
                                        color: Colors.transparent,
                                      )
                                  ),
                                ),
                                title: Text(character['name']),
                                trailing: Text(character['status'],
                                    style: TextStyle(
                                        color: character['status'] == 'Alive'
                                            ? Colors.green
                                            : Colors.red)),
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CharacterScreen(character)));
                                },
                              );
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
          onExpansionChanged: (value) {
            if (value) {
              String urlFormatted = _utils.getFormattedUrlWithId(
                  _episode['characters'], 'character');
              _episodeStore.getCharacters(urlFormatted);
            }
          },
        ),
      ),
    );
  }
}
