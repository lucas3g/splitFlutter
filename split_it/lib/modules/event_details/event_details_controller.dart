import 'package:mobx/mobx.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'event_details_controller.g.dart';

class EventDetailsController = _EventDetailsControllerBase
    with _$EventDetailsController;

abstract class _EventDetailsControllerBase with Store {
  final FirebaseRepository repository;
  _EventDetailsControllerBase({
    required this.repository,
  });

  @observable
  EventDetailsStatus status = EventDetailsStatusEmpty();

  @action
  void update(EventDetailsStatus status) {
    this.status = status;
  }

  @action
  Future<void> delete(String id) async {
    update(EventDetailsStatusLoading());
    final response =
        await this.repository.delete(collection: '/events', id: id);
    if (response) {
      update(EventDetailsStatusSuccess());
    } else {
      update(EventDetailsStatusFailure(
          message: 'Não foi possível remover o evento!'));
    }
  }
}
