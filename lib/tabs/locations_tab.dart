import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';
import 'package:rickandmortywiki/stores/location_store.dart';
import 'package:rickandmortywiki/tiles/location_tile.dart';

class LocationsTab extends StatefulWidget {
  @override
  _LocationsTabState createState() => _LocationsTabState();
}

class _LocationsTabState extends State<LocationsTab> with AutomaticKeepAliveClientMixin{
  final LocationStore _locationStore = LocationStore();
  final ScrollController _scrollController = ScrollController();
  final RickAndMortyApi _rickAndMortyApi = RickAndMortyApi();
  int page = 1;

  @override
  void initState() {
    super.initState();
    _locationStore.getLocations();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_locationStore.loadMore) {
          page += 1;
          _rickAndMortyApi.getLocationPage(page).then((data) {
            _locationStore.setLocationToList(data['results']);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Observer(
              builder: (_) {
                if (_locationStore.state == LocationState.initial) {
                  return Container();
                } else if (_locationStore.state == LocationState.loading) {
                  return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)));
                } else {
                  return ListView.builder(
                      controller: _scrollController,
                      itemCount: _locationStore.loadMore ?_locationStore.locationList.length + 1 : _locationStore.locationList.length,
                      itemBuilder: (context, index) {
                        if (index == _locationStore.locationList.length &&
                            _locationStore.loadMore) {
                          return Center(
                              child: Container(
                            padding: EdgeInsets.all(10),
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white)),
                          ));
                        } else {
                          if(_locationStore.locationList[index]['residents'].isNotEmpty){
                            return LocationTile(_locationStore.locationList[index]);
                          }
                          return Container();
                        }
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
