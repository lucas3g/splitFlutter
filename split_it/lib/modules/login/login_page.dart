import 'package:flutter/material.dart';
import 'package:split_it/modules/login/widgets/social_button.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                width: 300,
                padding: EdgeInsets.only(right: 30),
                child: ListTile(
                  leading: Image.asset('assets/images/emoji.png'),
                  title: Text('Faça seu login com uma das contas abaixo',
                      style: AppTheme.textStyles.button),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SocialButtonWidget(
                    imagePath: 'assets/images/google.png',
                    label: 'Entrar com Google'),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SocialButtonWidget(
                    imagePath: 'assets/images/apple.png',
                    label: 'Entrar com Apple'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
