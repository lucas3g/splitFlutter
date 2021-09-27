import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';

import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'check_rounded_controller.g.dart';

enum CheckRoundedStatus { empty, loading, error, success }

class CheckRoundedController = _CheckRoundedControllerBase
    with _$CheckRoundedController;

abstract class _CheckRoundedControllerBase with Store {
  final FirebaseRepository repository;
  late EventModel event;

  _CheckRoundedControllerBase({
    required this.repository,
    required this.event,
  });

  @observable
  CheckRoundedStatus status = CheckRoundedStatus.empty;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      status = CheckRoundedStatus.loading;
      final friends = event.friends;

      final indexWhere =
          event.friends.indexWhere((element) => element == friend);

      final isPaid = !friends[indexWhere].isPaid;

      friends[indexWhere] = friends[indexWhere].copyWith(isPaid: isPaid);

      final newPaid =
          event.paid + (isPaid ? event.valueSplit : -event.valueSplit);

      event = event.copyWith(friends: friends, paid: newPaid);

      await repository.update(id: event.id, collectin: '/events', model: event);

      if (isPaid) {
        status = CheckRoundedStatus.success;
      } else {
        status = CheckRoundedStatus.empty;
      }
    } catch (e) {
      status = CheckRoundedStatus.error;
    }
  }
}
