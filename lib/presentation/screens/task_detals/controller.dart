import 'package:esferasoft/data/models/data_models/task.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/routes/routes.dart';
import '../../../data/models/data_models/response.dart';
import '../../../data/repositories/tasks.dart';

class TaskDetailViewController extends GetxController {

  TaskModel? task = Get.arguments?["taskModel"];

  bool isLoading = false;
  bool isDataUpdated = false;

  Future<void> navigateToEditForm() async {
    var result = await Get.toNamed(Routes.taskForm, arguments: {"taskModel": task});
    if(result is TaskModel) {
      task = result;
      isDataUpdated = true;
      update();
    }
  }

  Future<void> updateTaskStatus() async {
    try {
      toggleIsLoading();
      Map<String, dynamic> params = (task?..status = !(task?.status ?? false))?.toJson() ?? {};

      params.addEntries({"updatedAt" : DateFormat("yyy-MM-dd").format(DateTime.now())}.entries);

      ApiResponse response = await TasksRepository().updateTask(id: task?.id, params: params);
      if(!(response.status ?? false)) {

      } else {
        task = response.data;
        isDataUpdated = true;
      }
    } catch (e) {
      rethrow;
    } finally {
      toggleIsLoading();
    }
  }

  Future<void> deleteTask() async {
    try {
      toggleIsLoading();
      ApiResponse response = await TasksRepository().deleteTask(id: task?.id);
      if(!(response.status ?? false)) {

      } else {
        task = response.data;
        isDataUpdated = true;
      }
      Get.back(result: isDataUpdated);
    } catch (e) {
      rethrow;
    } finally {
      toggleIsLoading();
    }
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    update();
  }

  void onPopInvoked(bool didPop, result) => Get.back(result: isDataUpdated);

}
