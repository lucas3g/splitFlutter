import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/user_model.dart';

abstract class LoginService {
  Future<UserModel> googleSignin();
}

class LoginServiceImp implements LoginService {
  @override
  Future<UserModel> googleSignin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final account = await _googleSignIn.signIn();

    return UserModel.google(account!);
  }
}
