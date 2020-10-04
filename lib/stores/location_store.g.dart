// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LocationStore on _LocationStore, Store {
  Computed<LocationState> _$stateComputed;

  @override
  LocationState get state =>
      (_$stateComputed ??= Computed<LocationState>(() => super.state)).value;
  Computed<LocationState> _$characterStateComputed;

  @override
  LocationState get characterState => (_$characterStateComputed ??=
          Computed<LocationState>(() => super.characterState))
      .value;
  Computed<bool> _$loadMoreComputed;

  @override
  bool get loadMore =>
      (_$loadMoreComputed ??= Computed<bool>(() => super.loadMore)).value;

  final _$locationFutureAtom = Atom(name: '_LocationStore.locationFuture');

  @override
  ObservableFuture<dynamic> get locationFuture {
    _$locationFutureAtom.context.enforceReadPolicy(_$locationFutureAtom);
    _$locationFutureAtom.reportObserved();
    return super.locationFuture;
  }

  @override
  set locationFuture(ObservableFuture<dynamic> value) {
    _$locationFutureAtom.context.conditionallyRunInAction(() {
      super.locationFuture = value;
      _$locationFutureAtom.reportChanged();
    }, _$locationFutureAtom, name: '${_$locationFutureAtom.name}_set');
  }

  final _$charactersFutureAtom = Atom(name: '_LocationStore.charactersFuture');

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

  final _$locationListAtom = Atom(name: '_LocationStore.locationList');

  @override
  ObservableList<dynamic> get locationList {
    _$locationListAtom.context.enforceReadPolicy(_$locationListAtom);
    _$locationListAtom.reportObserved();
    return super.locationList;
  }

  @override
  set locationList(ObservableList<dynamic> value) {
    _$locationListAtom.context.conditionallyRunInAction(() {
      super.locationList = value;
      _$locationListAtom.reportChanged();
    }, _$locationListAtom, name: '${_$locationListAtom.name}_set');
  }

  final _$getLocationsAsyncAction = AsyncAction('getLocations');

  @override
  Future<void> getLocations() {
    return _$getLocationsAsyncAction.run(() => super.getLocations());
  }

  final _$getCharactersAsyncAction = AsyncAction('getCharacters');

  @override
  Future<void> getCharacters(String formattedUrl) {
    return _$getCharactersAsyncAction
        .run(() => super.getCharacters(formattedUrl));
  }

  final _$_LocationStoreActionController =
      ActionController(name: '_LocationStore');

  @override
  void setLocationToList(List<dynamic> list) {
    final _$actionInfo = _$_LocationStoreActionController.startAction();
    try {
      return super.setLocationToList(list);
    } finally {
      _$_LocationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'locationFuture: ${locationFuture.toString()},charactersFuture: ${charactersFuture.toString()},locationList: ${locationList.toString()},state: ${state.toString()},characterState: ${characterState.toString()},loadMore: ${loadMore.toString()}';
    return '{$string}';
  }
}
