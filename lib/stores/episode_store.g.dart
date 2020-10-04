// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EpisodeStore on _EpisodeStore, Store {
  Computed<EpisodeState> _$stateComputed;

  @override
  EpisodeState get state =>
      (_$stateComputed ??= Computed<EpisodeState>(() => super.state)).value;
  Computed<EpisodeState> _$characterStateComputed;

  @override
  EpisodeState get characterState => (_$characterStateComputed ??=
          Computed<EpisodeState>(() => super.characterState))
      .value;
  Computed<bool> _$loadMoreComputed;

  @override
  bool get loadMore =>
      (_$loadMoreComputed ??= Computed<bool>(() => super.loadMore)).value;

  final _$episodeFutureAtom = Atom(name: '_EpisodeStore.episodeFuture');

  @override
  ObservableFuture<dynamic> get episodeFuture {
    _$episodeFutureAtom.context.enforceReadPolicy(_$episodeFutureAtom);
    _$episodeFutureAtom.reportObserved();
    return super.episodeFuture;
  }

  @override
  set episodeFuture(ObservableFuture<dynamic> value) {
    _$episodeFutureAtom.context.conditionallyRunInAction(() {
      super.episodeFuture = value;
      _$episodeFutureAtom.reportChanged();
    }, _$episodeFutureAtom, name: '${_$episodeFutureAtom.name}_set');
  }

  final _$charactersFutureAtom = Atom(name: '_EpisodeStore.charactersFuture');

  @override
  ObservableFuture<dynamic> get charactersFuture {
    _$charactersFutureAtom.context.enforceReadPolicy(_$charactersFutureAtom);
    _$charactersFutureAtom.reportObserved();
    return super.charactersFuture;
  }

  @override
  set charactersFuture(ObservableFuture<dynamic> value) {
    _$charactersFutureAtom.context.conditionallyRunInAction(() {
      super.charactersFuture = value;
      _$charactersFutureAtom.reportChanged();
    }, _$charactersFutureAtom, name: '${_$charactersFutureAtom.name}_set');
  }

  final _$_episodesLengthAtom = Atom(name: '_EpisodeStore._episodesLength');

  @override
  int get _episodesLength {
    _$_episodesLengthAtom.context.enforceReadPolicy(_$_episodesLengthAtom);
    _$_episodesLengthAtom.reportObserved();
    return super._episodesLength;
  }

  @override
  set _episodesLength(int value) {
    _$_episodesLengthAtom.context.conditionallyRunInAction(() {
      super._episodesLength = value;
      _$_episodesLengthAtom.reportChanged();
    }, _$_episodesLengthAtom, name: '${_$_episodesLengthAtom.name}_set');
  }

  final _$episodeListAtom = Atom(name: '_EpisodeStore.episodeList');

  @override
  ObservableList<dynamic> get episodeList {
    _$episodeListAtom.context.enforceReadPolicy(_$episodeListAtom);
    _$episodeListAtom.reportObserved();
    return super.episodeList;
  }

  @override
  set episodeList(ObservableList<dynamic> value) {
    _$episodeListAtom.context.conditionallyRunInAction(() {
      super.episodeList = value;
      _$episodeListAtom.reportChanged();
    }, _$episodeListAtom, name: '${_$episodeListAtom.name}_set');
  }

  final _$getEpisodesAsyncAction = AsyncAction('getEpisodes');

  @override
  Future<void> getEpisodes() {
    return _$getEpisodesAsyncAction.run(() => super.getEpisodes());
  }

  final _$getCharactersAsyncAction = AsyncAction('getCharacters');

  @override
  Future<void> getCharacters(String formattedUrl) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(formattedUrl));
  }

  final _$_EpisodeStoreActionController =
      ActionController(name: '_EpisodeStore');

  @override
  void setEpisodeToList(List<dynamic> list) {
    final _$actionInfo = _$_EpisodeStoreActionController.startAction();
    try {
      return super.setEpisodeToList(list);
    } finally {
      _$_EpisodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEpisodeLength(int length) {
    final _$actionInfo = _$_EpisodeStoreActionController.startAction();
    try {
      return super.setEpisodeLength(length);
    } finally {
      _$_EpisodeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'episodeFuture: ${episodeFuture.toString()},charactersFuture: ${charactersFuture.toString()},episodeList: ${episodeList.toString()},state: ${state.toString()},characterState: ${characterState.toString()},loadMore: ${loadMore.toString()}';
    return '{$string}';
  }
}
