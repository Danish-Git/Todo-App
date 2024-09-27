import 'package:esferasoft/app/helpers/helper.dart';
import 'package:esferasoft/presentation/global/widgets/button/constants/button_type.dart';
import 'package:esferasoft/presentation/global/widgets/button/inidex.dart';
import 'package:esferasoft/presentation/global/widgets/priority_selector/index.dart';
import 'package:esferasoft/presentation/global/widgets/text/constants/font_size.dart';
import 'package:esferasoft/presentation/global/widgets/text/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/themes/index.dart';
import 'controller.dart';

class TaskDetailView extends StatelessWidget {
  const TaskDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailViewController>(
      global: false,
      init: TaskDetailViewController(),
      builder: (controller) => PopScope(
        canPop: false,
        onPopInvokedWithResult: controller.onPopInvoked,
        child: Scaffold(
          backgroundColor: EMAppTheme.themeColors.primary,
          appBar: AppBar(
            backgroundColor: EMAppTheme.themeColors.primary,
            centerTitle: true,
            leading: IconButton(onPressed: () => Get.back(result: controller.isDataUpdated), icon: Icon(Icons.arrow_back, color: EMAppTheme.themeColors.text)),
            title: const TextWidget(text: "Task Details", fontSize: EMFontSize.title,),
          ),
          body: Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTitleWidget("Title"),
                        getDescriptionWidget(description: controller.task?.title ?? ""),

                        getTitleWidget("Description"),
                        controller.task?.description?.isEmpty ?? true
                          ? getDescriptionWidget(description: "Please add some description to the task")
                          : getDescriptionWidget(description: controller.task?.description ?? ""),

                        getTitleWidget("Priority"),
                        getDescriptionWidget(
                          child: Column(
                            children: [
                              PrioritySelector(
                                onChange: (_) => null,
                                selectedValue: double.parse(controller.task?.priority?.toString() ?? "0"),
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(text: "Low", color: EMAppTheme.themeColors.primary,),
                                    TextWidget(text: "Mid", color: EMAppTheme.themeColors.primary,),
                                    TextWidget(text: "High", color: EMAppTheme.themeColors.primary,),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getTitleWidget("Due Date"),
                                      getDescriptionWidget(description: controller.task?.deadLine ?? "")
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      getTitleWidget("Task Statue"),
                                      getDescriptionWidget(description: controller.task?.status ?? false ? "Completed" : "Pending")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      getTitleWidget("Created On"),
                                      getDescriptionWidget(description: controller.task?.createdAt ?? "")
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      getTitleWidget("Last Modified On"),
                                      getDescriptionWidget(description: controller.task?.updatedAt ?? "")
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      color: EMAppTheme.themeColors.primary,
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: controller.isLoading ? Helper.showLoading() : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            buttonType: ButtonType.medium,
                            leadingIcon: Icon(Icons.delete_outline_outlined, color: EMAppTheme.themeColors.primary, size: 30),
                            onTap: controller.deleteTask,
                          ),
                          CustomButton(
                            buttonType: ButtonType.large,
                            title: "Mark As ${controller.task?.status ?? false ? "Pending" : "Completed"}",
                            titleColor: EMAppTheme.themeColors.primary,
                            onTap: controller.updateTaskStatus,
                          ),
                          CustomButton(
                            buttonType: ButtonType.medium,
                            leadingIcon: Icon(Icons.edit, color: EMAppTheme.themeColors.primary, size: 30),
                            titleColor: EMAppTheme.themeColors.primary,
                            onTap: controller.navigateToEditForm,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget getTitleWidget(String title) => Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 5),
    child: TextWidget(
      text: title,
      fontSize: EMFontSize.subTitle,
      color: EMAppTheme.themeColors.lightBlue,
    ),
  );

  Widget getDescriptionWidget({String? description, Widget? child}) => Container(
    width: double.maxFinite,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: EMAppTheme.themeColors.base,
        borderRadius: BorderRadius.circular(10)
    ),
    child: child ?? TextWidget(
      text: description ?? "",
      fontSize: EMFontSize.title,
      color: EMAppTheme.themeColors.primary,
    ),
  );
}