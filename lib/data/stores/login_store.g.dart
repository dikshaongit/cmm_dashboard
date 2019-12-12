// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$LoginStore on _LoginStore, Store {
  final _$loginStateAtom = Atom(name: '_LoginStore.loginState');

  @override
  LoginState get loginState {
    _$loginStateAtom.context.enforceReadPolicy(_$loginStateAtom);
    _$loginStateAtom.reportObserved();
    return super.loginState;
  }

  @override
  set loginState(LoginState value) {
    _$loginStateAtom.context.conditionallyRunInAction(() {
      super.loginState = value;
      _$loginStateAtom.reportChanged();
    }, _$loginStateAtom, name: '${_$loginStateAtom.name}_set');
  }

  final _$userIdAtom = Atom(name: '_LoginStore.userId');

  @override
  String get userId {
    _$userIdAtom.context.enforceReadPolicy(_$userIdAtom);
    _$userIdAtom.reportObserved();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.context.conditionallyRunInAction(() {
      super.userId = value;
      _$userIdAtom.reportChanged();
    }, _$userIdAtom, name: '${_$userIdAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$isErrorAtom = Atom(name: '_LoginStore.isError');

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

  final _$errorsAtom = Atom(name: '_LoginStore.errors');

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

  final _$authenticateAsyncAction = AsyncAction('authenticate');

  @override
  Future authenticate() {
    return _$authenticateAsyncAction.run(() => super.authenticate());
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$validateAsyncAction = AsyncAction('validate');

  @override
  Future validate() {
    return _$validateAsyncAction.run(() => super.validate());
  }
}
