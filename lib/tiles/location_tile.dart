import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmortywiki/helpers/utils.dart';
import 'package:rickandmortywiki/screens/character_screen.dart';
import 'package:rickandmortywiki/stores/location_store.dart';

class LocationTile extends StatelessWidget {
  final location;

  LocationTile(this.location);

  final LocationStore _locationStore = LocationStore();
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
          title: Text('${location['name']} (${location['dimension']})'),
          subtitle: Text(location['type'], style: TextStyle(fontSize: 10)),
          children: <Widget>[
            Container(

              padding: EdgeInsets.only(top: 2, bottom: 3, left: 3),
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      if (_locationStore.characterState ==
                          LocationState.initial) {
                        return Container();
                      } else if (_locationStore.characterState ==
                          LocationState.loading) {
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
                            itemCount: _locationStore.charactersFuture.result.toString().startsWith('[')?
                            _locationStore.charactersFuture.result.length : 1,
                            itemBuilder: (context, index) {
                              var character = _locationStore.charactersFuture.result.toString().startsWith('[') ?
                                  _locationStore.charactersFuture.result[index] : _locationStore.charactersFuture.result;
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor:Colors.transparent,
                                  backgroundImage:
                                      NetworkImage(character['image']),
                                  child: Hero(
                                      tag: character['id'],
                                      child: Image.network(
                                        character['image'],
                                        color: Colors.transparent,
                                      )),
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
            if(value){
              String formattedUrl = _utils.getFormattedUrlWithId(
                  location['residents'], 'character');
              _locationStore.getCharacters(formattedUrl);
            }
          },
        ),
      ),
    );
  }
}
