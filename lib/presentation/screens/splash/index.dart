import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/constants/app_config.dart';
import '../../../app/themes/index.dart';
import '../../global/widgets/text/constants/font_size.dart';
import '../../global/widgets/text/constants/font_weight.dart';
import '../../global/widgets/text/index.dart';
import 'controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      global: false,
      init: SplashController(),
      builder: (controller) => Scaffold(
        backgroundColor: EMAppTheme.themeColors.primary,
        body: SafeArea(
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.task_outlined,
                  color: EMAppTheme.themeColors.text,
                  size: 100),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextWidget(
                    text: AppConfig.appName.tr,
                    fontSize: EMFontSize.title,
                    fontWeight: EMFontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: EMAppTheme.themeColors.text,
                  ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
