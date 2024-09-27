import 'package:esferasoft/app/enums/home_tab_view_type.dart';
import 'package:esferasoft/app/helpers/helper.dart';
import 'package:esferasoft/app/themes/index.dart';
import 'package:esferasoft/presentation/global/widgets/text/constants/font_size.dart';
import 'package:esferasoft/presentation/global/widgets/text/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:get/get.dart';

import '../../global/widgets/button/constants/button_type.dart';
import '../../global/widgets/button/inidex.dart';
import 'controller.dart';
import 'widgets/tab_view/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      global: false,
      init: HomeViewController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: EMAppTheme.themeColors.primary,
          body: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: "Good ${controller.dayGreeting}!\nDanish", fontSize: EMFontSize.title),
                      Container(
                        height: 50, width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: const DecorationImage(image: NetworkImage("https://picsum.photos/200"))
                        ),
                      )
                    ],
                  ),

                  controller.isLoading
                    ? Expanded(child: Helper.showLoading())
                    :  controller.errorMessage?.isNotEmpty ?? false
                    ? Expanded(child: Helper.showErrorMessage(message: controller.errorMessage))
                    : Expanded(
                    child: Column(
                      children: [
                        TabBar(
                          controller: controller.tabController,
                          tabs: controller.homeViewTabs,
                          indicatorColor: EMAppTheme.themeColors.warning,
                          unselectedLabelColor: EMAppTheme.themeColors.text,
                          labelColor: EMAppTheme.themeColors.warning,
                          dividerColor: EMAppTheme.themeColors.primary,
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: controller.tabController,
                              children: [
                                HomeTabView(type: HomeTabViewType.all, taskList: controller.taskList, refreshData: controller.onRefreshData),
                                HomeTabView(type: HomeTabViewType.pending, taskList: controller.taskList, refreshData: controller.onRefreshData),
                                HomeTabView(type: HomeTabViewType.completed, taskList: controller.taskList, refreshData: controller.onRefreshData),
                              ]
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Visibility(
            visible: !Breakpoints.mediumAndUp.isActive(context),
            child: CustomButton(
              buttonType: ButtonType.small,
              leadingIcon: const Icon(Icons.add),
              onTap: controller.navigateToTaskForm,
            ),
          )
        )
      ),
    );
  }
}
