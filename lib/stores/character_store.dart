import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:rickandmortywiki/api/rick_and_morty_api.dart';

part 'character_store.g.dart';

class CharacterStore = _CharacterStore with _$CharacterStore;
enum CharacterState { initial, loading, loaded }

abstract class _CharacterStore with Store {
  final RickAndMortyApi _rickAndMortyApi = RickAndMortyApi();
  _CharacterStore(){
    when((_) => !carouselLoaded, () => setCarouselLoaded());
  }
  @observable
  ObservableFuture characterFuture;

  @observable
  int charactersLength;

  @observable
  int currentImage = 0;

  @observable
  bool carouselLoaded = false;

  @computed
  CharacterState get state {
    if (characterFuture == null ||
        characterFuture.status == FutureStatus.rejected) {
      return CharacterState.initial;
    } else if (characterFuture.status == FutureStatus.pending) {
      return CharacterState.loading;
    } else {
      setLength(characterFuture.result['results'].length);
      return CharacterState.loaded;
    }
  }

  @action
  Future<void> getCharacters() async {
    try {
      characterFuture = ObservableFuture(_rickAndMortyApi.getCharacters());
    } catch (e) {
      print(e);
    }
  }

  @action
  void setCurrentImage(int index) => currentImage = index;

  @action
  void setLength(int length) => charactersLength = length;

  @action
  void setCarouselLoaded(){
    Future.delayed(Duration(milliseconds:2800),(){
      carouselLoaded = true;
    });
  }
}
