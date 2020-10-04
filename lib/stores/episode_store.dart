import 'package:mobx/mobx.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';

part 'episode_store.g.dart';

class EpisodeStore = _EpisodeStore with _$EpisodeStore;
enum EpisodeState { initial, loading, loaded }

abstract class _EpisodeStore with Store {
  final RickAndMortyApi _rickAndMortyApi = RickAndMortyApi();

  _EpisodeStore() {
//    autorun((_) {
//    });
  }

  @observable
  ObservableFuture episodeFuture;

  @observable
  ObservableFuture charactersFuture;

  @observable
  int _episodesLength = 0;

  @observable
  ObservableList<dynamic> episodeList = ObservableList<dynamic>();

  @computed
  EpisodeState get state {
    if (episodeFuture == null ||
        episodeFuture.status == FutureStatus.rejected) {
      return EpisodeState.initial;
    } else if (episodeFuture.status == FutureStatus.pending) {
      return EpisodeState.loading;
    } else {
      setEpisodeToList(episodeFuture.result['results']);
      return EpisodeState.loaded;
    }
  }

  @computed
  EpisodeState get characterState {
    if (charactersFuture == null ||
        charactersFuture.status == FutureStatus.rejected) {
      return EpisodeState.initial;
    } else if (charactersFuture.status == FutureStatus.pending) {
      return EpisodeState.loading;
    } else {
      return EpisodeState.loaded;
    }
  }

  @computed
  bool get loadMore =>
      episodeList.length < episodeFuture.result['info']['count'];

  @action
  Future<void> getEpisodes() async {
    try {
      episodeFuture = ObservableFuture(_rickAndMortyApi.getEpisodes());
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> getCharacters(String formattedUrl) async {
    try {
      charactersFuture = ObservableFuture(
          _rickAndMortyApi.getCharacters(formattedUrl: formattedUrl));
    } catch (e) {
      print(e);
    }
  }

  @action
  void setEpisodeToList(List<dynamic> list) {
    list.forEach((l) {
      episodeList.add(l);
    });
  }

  @action
  void setEpisodeLength(int length) => _episodesLength = length;
}
