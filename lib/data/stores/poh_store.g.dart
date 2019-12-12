// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poh_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PohStore on _PohStore, Store {
  Computed<dynamic> _$filteredRecordComputed;

  @override
  dynamic get filteredRecord => (_$filteredRecordComputed ??=
          Computed<dynamic>(() => super.filteredRecord))
      .value;
  Computed<dynamic> _$totalComputed;

  @override
  dynamic get total =>
      (_$totalComputed ??= Computed<dynamic>(() => super.total)).value;

  final _$stateAtom = Atom(name: '_PohStore.state');

  @override
  ApiState get state {
    _$stateAtom.context.enforceReadPolicy(_$stateAtom);
    _$stateAtom.reportObserved();
    return super.state;
  }

  @override
  set state(ApiState value) {
    _$stateAtom.context.conditionallyRunInAction(() {
      super.state = value;
      _$stateAtom.reportChanged();
    }, _$stateAtom, name: '${_$stateAtom.name}_set');
  }

  final _$isErrorAtom = Atom(name: '_PohStore.isError');

  @override
  bool get isError {
    _$isErrorAtom.context.enforceReadPolicy(_$isErrorAtom);
    _$isErrorAtom.reportObserved();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.context.conditionallyRunInAction(() {
      super.isError = value;
      _$isErrorAtom.reportChanged();
    }, _$isErrorAtom, name: '${_$isErrorAtom.name}_set');
  }

  final _$errorsAtom = Atom(name: '_PohStore.errors');

  @override
  List<String> get errors {
    _$errorsAtom.context.enforceReadPolicy(_$errorsAtom);
    _$errorsAtom.reportObserved();
    return super.errors;
  }

  @override
  set errors(List<String> value) {
    _$errorsAtom.context.conditionallyRunInAction(() {
      super.errors = value;
      _$errorsAtom.reportChanged();
    }, _$errorsAtom, name: '${_$errorsAtom.name}_set');
  }

  final _$pohListAtom = Atom(name: '_PohStore.pohList');

  @override
  List<Poh> get pohList {
    _$pohListAtom.context.enforceReadPolicy(_$pohListAtom);
    _$pohListAtom.reportObserved();
    return super.pohList;
  }

  @override
  set pohList(List<Poh> value) {
    _$pohListAtom.context.conditionallyRunInAction(() {
      super.pohList = value;
      _$pohListAtom.reportChanged();
    }, _$pohListAtom, name: '${_$pohListAtom.name}_set');
  }

  final _$_mapAtom = Atom(name: '_PohStore._map');

  @override
  Map<String, List<Poh>> get _map {
    _$_mapAtom.context.enforceReadPolicy(_$_mapAtom);
    _$_mapAtom.reportObserved();
    return super._map;
  }

  @override
  set _map(Map<String, List<Poh>> value) {
    _$_mapAtom.context.conditionallyRunInAction(() {
      super._map = value;
      _$_mapAtom.reportChanged();
    }, _$_mapAtom, name: '${_$_mapAtom.name}_set');
  }

  final _$_currentLevelAtom = Atom(name: '_PohStore._currentLevel');

  @override
  int get _currentLevel {
    _$_currentLevelAtom.context.enforceReadPolicy(_$_currentLevelAtom);
    _$_currentLevelAtom.reportObserved();
    return super._currentLevel;
  }

  @override
  set _currentLevel(int value) {
    _$_currentLevelAtom.context.conditionallyRunInAction(() {
      super._currentLevel = value;
      _$_currentLevelAtom.reportChanged();
    }, _$_currentLevelAtom, name: '${_$_currentLevelAtom.name}_set');
  }

  final _$colTagsAtom = Atom(name: '_PohStore.colTags');

  @override
  List<String> get colTags {
    _$colTagsAtom.context.enforceReadPolicy(_$colTagsAtom);
    _$colTagsAtom.reportObserved();
    return super.colTags;
  }

  @override
  set colTags(List<String> value) {
    _$colTagsAtom.context.conditionallyRunInAction(() {
      super.colTags = value;
      _$colTagsAtom.reportChanged();
    }, _$colTagsAtom, name: '${_$colTagsAtom.name}_set');
  }

  final _$initializeAsyncAction = AsyncAction('initialize');

  @override
  Future initialize(PohCategory category) {
    return _$initializeAsyncAction.run(() => super.initialize(category));
  }

  final _$_PohStoreActionController = ActionController(name: '_PohStore');

  @override
  dynamic _init() {
    final _$actionInfo = _$_PohStoreActionController.startAction();
    try {
      return super._init();
    } finally {
      _$_PohStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic drillIn(String tag) {
    final _$actionInfo = _$_PohStoreActionController.startAction();
    try {
      return super.drillIn(tag);
    } finally {
      _$_PohStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic drillOut() {
    final _$actionInfo = _$_PohStoreActionController.startAction();
    try {
      return super.drillOut();
    } finally {
      _$_PohStoreActionController.endAction(_$actionInfo);
    }
  }
}
