import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';
import 'package:rickandmortywiki/stores/episode_store.dart';
import 'package:rickandmortywiki/tiles/episode_tile.dart';

class EpisodesTab extends StatefulWidget {
  @override
  _EpisodesTabState createState() => _EpisodesTabState();
}

class _EpisodesTabState extends State<EpisodesTab> with AutomaticKeepAliveClientMixin{
  final EpisodeStore _episodeStore = EpisodeStore();
  final ScrollController _scrollController = ScrollController();
  final RickAndMortyApi _rickAndMortyApi = RickAndMortyApi();
  String _nextPage;

  @override
  void initState() {
    super.initState();
    _episodeStore.getEpisodes();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_episodeStore.loadMore) {
          _rickAndMortyApi.getEpisodePage(_nextPage).then((data) {
            _episodeStore.setEpisodeToList(data['results']);
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
                if (_episodeStore.state == EpisodeState.initial) {
                  return Container();
                } else if (_episodeStore.state == EpisodeState.loading) {
                  return Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)));
                } else {
                  _nextPage =
                      _episodeStore.episodeFuture.result['info']['next'];
                  return ListView.builder(
                      controller: _scrollController,
                      itemCount: _episodeStore.loadMore ?_episodeStore.episodeList.length + 1 : _episodeStore.episodeList.length,
                      itemBuilder: (context, index) {
                        if (index == _episodeStore.episodeList.length && _episodeStore.loadMore) {
                          return Center(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: CircularProgressIndicator(
                                    valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white)),
                              ));
                        } else {
                          return EpisodeTile(_episodeStore.episodeList[index]);
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

