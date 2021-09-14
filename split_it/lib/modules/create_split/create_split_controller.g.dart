// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_split_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateSplitController on _CreateSplitControllerBase, Store {
  Computed<bool>? _$enableNavigateButtonComputed;

  @override
  bool get enableNavigateButton => (_$enableNavigateButtonComputed ??=
          Computed<bool>(() => super.enableNavigateButton,
              name: '_CreateSplitControllerBase.enableNavigateButton'))
      .value;

  final _$currentPageAtom =
      Atom(name: '_CreateSplitControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$eventNameAtom = Atom(name: '_CreateSplitControllerBase.eventName');

  @override
  String get eventName {
    _$eventNameAtom.reportRead();
    return super.eventName;
  }

  @override
  set eventName(String value) {
    _$eventNameAtom.reportWrite(value, super.eventName, () {
      super.eventName = value;
    });
  }

  final _$_CreateSplitControllerBaseActionController =
      ActionController(name: '_CreateSplitControllerBase');

  @override
  void nextPage() {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void backPage() {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.backPage');
    try {
      return super.backPage();
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventName(String name) {
    final _$actionInfo = _$_CreateSplitControllerBaseActionController
        .startAction(name: '_CreateSplitControllerBase.setEventName');
    try {
      return super.setEventName(name);
    } finally {
      _$_CreateSplitControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
eventName: ${eventName},
enableNavigateButton: ${enableNavigateButton}
    ''';
  }
}
