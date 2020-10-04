import 'package:mobx/mobx.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';

part 'location_store.g.dart';

enum LocationState { initial, loading, loaded }

class LocationStore = _LocationStore with _$LocationStore;

abstract class _LocationStore with Store {
  final RickAndMortyApi _rickAndMortyApi = RickAndMortyApi();

  @observable
  ObservableFuture locationFuture;

  @observable
  ObservableFuture charactersFuture;

  @observable
  ObservableList<dynamic> locationList = ObservableList<dynamic>();

  @computed
  LocationState get state {
    if (locationFuture == null ||
        locationFuture.status == FutureStatus.rejected) {
      return LocationState.initial;
    } else if (locationFuture.status == FutureStatus.pending) {
      return LocationState.loading;
    } else {
      setLocationToList(locationFuture.result['results']);
      return LocationState.loaded;
    }
  }

  @computed
  LocationState get characterState {
    if (charactersFuture == null ||
        charactersFuture.status == FutureStatus.rejected) {
      return LocationState.initial;
    } else if (charactersFuture.status == FutureStatus.pending) {
      return LocationState.loading;
    } else {
      return LocationState.loaded;
    }
  }

  @computed
  bool get loadMore =>
      locationList.length < locationFuture.result['info']['count'];

  @action
  Future<void> getLocations() async {
    try {
      locationFuture = ObservableFuture(_rickAndMortyApi.getLocations());
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
  void setLocationToList(List<dynamic> list) {
    list.forEach((l) {
      locationList.add(l);
    });
  }
}
