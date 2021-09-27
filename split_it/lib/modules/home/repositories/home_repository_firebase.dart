import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

class HomeRepositoryFirebase implements HomeRepository {
  final client = FirebaseRepository();

  @override
  Future<DashBoardModel> getDashBoard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashBoardModel(
      send: 100,
      receive: 50,
    );
  }

  // @override
  // Future<List<EventModel>> getEvents() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   return [
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: 100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: 100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: 100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: 100,
  //     ),
  //     EventModel(
  //       name: 'Churrasco',
  //       created: DateTime.now(),
  //       value: -100,
  //     ),
  //   ];
  // }

  @override
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await client.get(
          collection: '/events', orderBy: 'created', descending: true);
      final events = response.map((e) => EventModel.fromMap(e)).toList();
      return events;
    } catch (e) {
      return [];
    }
  }
}
