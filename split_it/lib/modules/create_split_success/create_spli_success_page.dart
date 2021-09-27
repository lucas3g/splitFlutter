import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/shared/utils/formatters.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitSuccessPage extends StatelessWidget {
  final CreateSplitController controller;
  const CreateSplitSuccessPage({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            stops: [0.0, 1.0],
            transform: GradientRotation(2.35619),
            colors: [
              Color(0xFF40B38C),
              Color(0xFF45CC93),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              'assets/images/money.png',
              width: 240,
              height: 240,
            )),
            SizedBox(
              height: 48,
            ),
            Text(
              '${controller.event.friends.length} pessoas',
              style: AppTheme.textStyles.button
                  .copyWith(color: AppTheme.colors.backgroundPrimary),
            ),
            SizedBox(
              height: 8,
            ),
            Text(' ${controller.event.valueSplit.reais()}',
                style: AppTheme.textStyles.title
                    .copyWith(color: AppTheme.colors.backgroundPrimary)),
            SizedBox(
              height: 8,
            ),
            Text('para cada um',
                style: AppTheme.textStyles.button
                    .copyWith(color: AppTheme.colors.backgroundPrimary)),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.event.friends
                  .map((photos) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image:
                                    CachedNetworkImageProvider(photos.photoURL),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ))
                  .toList(),
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.0, 1.0],
                  transform: GradientRotation(2.35619),
                  colors: [
                    Color(0xFF40B38C),
                    Color(0xFF45CC93),
                  ]),
            ),
            height: 76,
            child: Center(
              child: Text(
                'OKAY :D',
                style: AppTheme.textStyles.stepperNextButton
                    .copyWith(color: AppTheme.colors.backgroundPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
