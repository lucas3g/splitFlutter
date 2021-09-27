// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventDetailsController on _EventDetailsControllerBase, Store {
  final _$statusAtom = Atom(name: '_EventDetailsControllerBase.status');

  @override
  EventDetailsStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(EventDetailsStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$deleteAsyncAction = AsyncAction('_EventDetailsControllerBase.delete');

  @override
  Future<void> delete(String id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  final _$_EventDetailsControllerBaseActionController =
      ActionController(name: '_EventDetailsControllerBase');

  @override
  void update(EventDetailsStatus status) {
    final _$actionInfo = _$_EventDetailsControllerBaseActionController
        .startAction(name: '_EventDetailsControllerBase.update');
    try {
      return super.update(status);
    } finally {
      _$_EventDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
