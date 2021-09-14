import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;

  setUp(() {
    repository = HomeRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test('Testando o getDashBoard - Sucesso', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(repository.getDashBoard)
        .thenAnswer((_) async => DashBoardModel(send: 123, receive: -23));
    await controller.getDashBoard();
    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateLoading>());
    expect(states[2], isInstanceOf<AppBarStateSuccess>());
    expect(states.length, 3);
  });

  test('Testando o getDashBoard - Erro', () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(repository.getDashBoard).thenThrow('Deu erro');
    await controller.getDashBoard();
    expect(states[0], isInstanceOf<AppBarStateEmpty>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, 'Deu erro');
    expect(states.length, 2);
  });
}
