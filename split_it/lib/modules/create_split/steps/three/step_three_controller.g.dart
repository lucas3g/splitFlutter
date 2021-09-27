// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_three_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepThreeController on _StepThreeControllerBase, Store {
  Computed<bool>? _$showButtonComputed;

  @override
  bool get showButton =>
      (_$showButtonComputed ??= Computed<bool>(() => super.showButton,
              name: '_StepThreeControllerBase.showButton'))
          .value;
  Computed<int>? _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_StepThreeControllerBase.currentIndex'))
          .value;

  final _$itemsAtom = Atom(name: '_StepThreeControllerBase.items');

  @override
  ObservableList<ItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$itemAtom = Atom(name: '_StepThreeControllerBase.item');

  @override
  ItemModel get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(ItemModel value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$_StepThreeControllerBaseActionController =
      ActionController(name: '_StepThreeControllerBase');

  @override
  void onChanged({String? name, double? value}) {
    final _$actionInfo = _$_StepThreeControllerBaseActionController.startAction(
        name: '_StepThreeControllerBase.onChanged');
    try {
      return super.onChanged(name: name, value: value);
    } finally {
      _$_StepThreeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem() {
    final _$actionInfo = _$_StepThreeControllerBaseActionController.startAction(
        name: '_StepThreeControllerBase.addItem');
    try {
      return super.addItem();
    } finally {
      _$_StepThreeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$_StepThreeControllerBaseActionController.startAction(
        name: '_StepThreeControllerBase.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_StepThreeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
item: ${item},
showButton: ${showButton},
currentIndex: ${currentIndex}
    ''';
  }
}
