import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashBoardModel> getDashBoard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashBoardModel(
      send: 100,
      receive: 50,
    );
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: 100,
      ),
      EventModel(
        name: 'Churrasco',
        created: DateTime.now(),
        value: -100,
      ),
    ];
  }
}
