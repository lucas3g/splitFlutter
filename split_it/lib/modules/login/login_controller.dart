import 'package:mobx/mobx.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/widgets/login_state.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginService service;
  final FirebaseRepository repository;

  _LoginControllerBase({required this.service, required this.repository});

  @observable
  LoginState state = LoginStateEmpty();

  @action
  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      final user = await service.googleSignin();
      state = LoginStateSuccess(user: user);
      if (state.runtimeType == LoginStateSuccess) {
        final exists = await repository.findUser(email: user.email);
        if (!exists) {
          this.repository.create(user);
        }
      }
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
    }
  }
}
