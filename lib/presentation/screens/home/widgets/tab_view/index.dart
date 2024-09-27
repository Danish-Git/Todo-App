import 'package:esferasoft/app/themes/index.dart';
import 'package:esferasoft/presentation/global/widgets/text/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/enums/home_tab_view_type.dart';
import '../../../../../data/models/data_models/task.dart';
import '../../../../global/widgets/text/constants/font_size.dart';
import '../../../../global/widgets/text/constants/font_weight.dart';
import 'controller.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key, required this.type, this.taskList, this.refreshData});

  final HomeTabViewType type;
  final List<TaskModel>? taskList;
  final VoidCallback? refreshData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeTabViewController>(
      global: false,
      init: HomeTabViewController(type: type, taskList : taskList, refreshData: refreshData),
      builder: (controller) => GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 80),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1,
          crossAxisSpacing: 10, mainAxisSpacing: 10,
        ),
        itemCount: controller.finalTaskList?.length,
        itemBuilder: (context, index) => Material(
          color: controller.getPriorityBGColor(controller.finalTaskList?[index].priority ?? 0),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => controller.navigateToTaskDetail(controller.finalTaskList![index], index),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextWidget(
                            text: controller.finalTaskList?[index].title ?? "",
                            fontSize: EMFontSize.title,
                            color: EMAppTheme.themeColors.primary,
                            fontWeight: EMFontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Visibility(
                            visible: controller.finalTaskList?[index].description?.isNotEmpty ?? false,
                            child: RichText(
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(fontSize: EMFontSize.text),
                              text: TextSpan(style: TextStyle(color: EMAppTheme.themeColors.primary),
                                text: controller.finalTaskList?[index].description ?? "",
                              ),
                            )),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      additionalDetails("Deadline", controller.finalTaskList?[index].deadLine ?? ""),
                      additionalDetails("Priority", controller.getPriorityStatus(controller.finalTaskList?[index].priority ?? 0)),
                      additionalDetails("Task Status", controller.finalTaskList?[index].status ?? false ? "Completed" : "Pending"),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget additionalDetails(String title, String description) => RichText(
    text: TextSpan(
      style: TextStyle(color: EMAppTheme.themeColors.primary, fontSize: EMFontSize.text),
      children: <TextSpan>[
        TextSpan(text: "$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: description),
      ],
    ),
  );
}
