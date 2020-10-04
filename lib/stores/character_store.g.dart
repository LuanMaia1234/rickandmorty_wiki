// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CharacterStore on _CharacterStore, Store {
  Computed<CharacterState> _$stateComputed;

  @override
  CharacterState get state =>
      (_$stateComputed ??= Computed<CharacterState>(() => super.state)).value;

  final _$characterFutureAtom = Atom(name: '_CharacterStore.characterFuture');

  @override
  ObservableFuture<dynamic> get characterFuture {
    _$characterFutureAtom.context.enforceReadPolicy(_$characterFutureAtom);
    _$characterFutureAtom.reportObserved();
    return super.characterFuture;
  }

  @override
  set characterFuture(ObservableFuture<dynamic> value) {
    _$characterFutureAtom.context.conditionallyRunInAction(() {
      super.characterFuture = value;
      _$characterFutureAtom.reportChanged();
    }, _$characterFutureAtom, name: '${_$characterFutureAtom.name}_set');
  }

  final _$charactersLengthAtom = Atom(name: '_CharacterStore.charactersLength');

  @override
  int get charactersLength {
    _$charactersLengthAtom.context.enforceReadPolicy(_$charactersLengthAtom);
    _$charactersLengthAtom.reportObserved();
    return super.charactersLength;
  }

  @override
  set charactersLength(int value) {
    _$charactersLengthAtom.context.conditionallyRunInAction(() {
      super.charactersLength = value;
      _$charactersLengthAtom.reportChanged();
    }, _$charactersLengthAtom, name: '${_$charactersLengthAtom.name}_set');
  }

  final _$currentImageAtom = Atom(name: '_CharacterStore.currentImage');

  @override
  int get currentImage {
    _$currentImageAtom.context.enforceReadPolicy(_$currentImageAtom);
    _$currentImageAtom.reportObserved();
    return super.currentImage;
  }

  @override
  set currentImage(int value) {
    _$currentImageAtom.context.conditionallyRunInAction(() {
      super.currentImage = value;
      _$currentImageAtom.reportChanged();
    }, _$currentImageAtom, name: '${_$currentImageAtom.name}_set');
  }

  final _$carouselLoadedAtom = Atom(name: '_CharacterStore.carouselLoaded');

  @override
  bool get carouselLoaded {
    _$carouselLoadedAtom.context.enforceReadPolicy(_$carouselLoadedAtom);
    _$carouselLoadedAtom.reportObserved();
    return super.carouselLoaded;
  }

  @override
  set carouselLoaded(bool value) {
    _$carouselLoadedAtom.context.conditionallyRunInAction(() {
      super.carouselLoaded = value;
      _$carouselLoadedAtom.reportChanged();
    }, _$carouselLoadedAtom, name: '${_$carouselLoadedAtom.name}_set');
  }

  final _$getCharactersAsyncAction = AsyncAction('getCharacters');

  @override
  Future<void> getCharacters() {
    return _$getCharactersAsyncAction.run(() => super.getCharacters());
  }

  final _$_CharacterStoreActionController =
      ActionController(name: '_CharacterStore');

  @override
  void setCurrentImage(int index) {
    final _$actionInfo = _$_CharacterStoreActionController.startAction();
    try {
      return super.setCurrentImage(index);
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLength(int length) {
    final _$actionInfo = _$_CharacterStoreActionController.startAction();
    try {
      return super.setLength(length);
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCarouselLoaded() {
    final _$actionInfo = _$_CharacterStoreActionController.startAction();
    try {
      return super.setCarouselLoaded();
    } finally {
      _$_CharacterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'characterFuture: ${characterFuture.toString()},charactersLength: ${charactersLength.toString()},currentImage: ${currentImage.toString()},carouselLoaded: ${carouselLoaded.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
