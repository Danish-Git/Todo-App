import 'dart:ui';

import 'package:esferasoft/app/themes/index.dart';
import 'package:get/get.dart';

import '../../../../../app/enums/home_tab_view_type.dart';
import '../../../../../app/routes/routes.dart';
import '../../../../../data/models/data_models/task.dart';

class HomeTabViewController extends GetxController {

  final HomeTabViewType type;
  final List<TaskModel>? taskList;
  final VoidCallback? refreshData;

  List<TaskModel>? finalTaskList = [];

  HomeTabViewController({required this.type, this.taskList, this.refreshData});

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    switch(type) {
      case HomeTabViewType.pending:
        getPendingTasksList();
        break;
      case HomeTabViewType.completed:
        getCompletedTasksList();
        break;
      default:
        finalTaskList = taskList;
        update();
        break;
    }
    update();
  }

  void getPendingTasksList() {
    finalTaskList = [];
    taskList?.forEach((element) {
      if(!(element.status ?? false)) {
        finalTaskList?.add(element);
      }
    });
  }

  void getCompletedTasksList() {
    finalTaskList = [];
    taskList?.forEach((element) {
      if(element.status ?? false) {
        finalTaskList?.add(element);
      }
    });
  }

  String getPriorityStatus(int priority) {
    switch(priority) {
      case 0:
        return "Low";
      case 1:
        return "Medium";
      case 2:
        return "High";
      default:
        return "Low";
    }
  }

  Color getPriorityBGColor(int priority) {
    switch(priority) {
      case 0:
        return EMAppTheme.themeColors.success.withOpacity(0.90);
      case 1:
        return EMAppTheme.themeColors.warning.withOpacity(0.90);
      case 2:
        return EMAppTheme.themeColors.red.withOpacity(0.90);
      default:
        return EMAppTheme.themeColors.success.withOpacity(0.90);
    }
  }

  Future<void> navigateToTaskDetail(TaskModel task, int index) async {
    var result = await Get.toNamed(Routes.taskDetails, arguments: {"taskModel": task});
    if(result is bool) {
      if(result) {
        refreshData?.call();
      }
      update();
    }
  }

}