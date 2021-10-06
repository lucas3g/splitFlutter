import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/widgets/login_state.dart';
import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/theme/app_theme.dart';
import 'package:vibration/vibration.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
        service: LoginServiceImp(), repository: FirebaseRepository());
    autorun((_) {
      if (controller.state is LoginStateSuccess) {
        final user = (controller.state as LoginStateSuccess).user;
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                Container(
                  width: 236,
                  child: Text(
                    'Divida suas contas com seus amigos',
                    style: AppTheme.textStyles.title,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 330,
                padding: EdgeInsets.only(right: 30),
                child: ListTile(
                  leading: Image.asset('assets/images/emoji.png'),
                  title: Text('Faça seu login com umas das contas abaixo.',
                      style: AppTheme.textStyles.button),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Observer(builder: (context) {
                if (controller.state is LoginStateLoading)
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SocialButtonWidget(
                      imagePath: '',
                      label: 'Entrar com Google',
                      onTap: () {},
                      isLoading: true,
                    ),
                  );
                else if (controller.state is LoginStateFailure)
                  return Text((controller.state as LoginStateFailure).message);
                else
                  return InkWell(
                    child: Ink(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: SocialButtonWidget(
                          imagePath: 'assets/images/google.png',
                          label: 'Entrar com Google',
                          onTap: () {
                            Vibration.vibrate(duration: 100);
                            controller.googleSignIn();
                          },
                        ),
                      ),
                    ),
                  );
              }),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SocialButtonWidget(
                    imagePath: 'assets/images/apple.png',
                    label: 'Entrar com Apple',
                    onTap: () {
                      Vibration.vibrate(duration: 100);
                      if (Platform.isAndroid) {
                        BotToast.showText(
                          text: 'Você está em um SmartPhone Android!',
                          contentColor: Colors.black,
                        );
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
