import 'package:esferasoft/data/repositories/tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/constants/app_config.dart';
import '../../../app/enums/task_form_type.dart';
import '../../../app/helpers/helper.dart';
import '../../../data/models/data_models/response.dart';
import '../../../data/models/data_models/task.dart';
import '../../global/widgets/bottom_sheet/index.dart';
import 'Widget/task_status_bottom_sheet.dart';

class TaskFormViewController extends GetxController {

  TaskModel? task = Get.arguments?["taskModel"];

  late TaskFormType formType;

  TextEditingController titleInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController dueDateInput = TextEditingController();
  TextEditingController taskStatusInput = TextEditingController();

  double? priority;

  ///   [selectedDate] is used to hold the value of date which is selected as an input as due date of the task
  DateTime selectedDate = DateTime.parse(DateFormat("yyy-MM-dd").format(DateTime.now()));
  bool? taskStatus;
  bool isLoading = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    initFormData();
  }

  void initFormData() {
    formType = task?.id?.isNotEmpty ?? false ? TaskFormType.edit : TaskFormType.add;
    if(formType == TaskFormType.edit) {
      titleInput.text = task?.title ?? "";
      descriptionInput.text = task?.description ?? "";
      priority = double.parse(task?.priority?.toString() ?? "0");
      selectedDate = DateTime.parse(task?.deadLine ?? "");
      setDateInput();
      taskStatus = task?.status;
      setTaskStatusInput();
    }
    update();
  }

  void onPriorityChange(double value) {
    priority = value;
    update();
  }


  ///   [selectDate] method is used to open date selector to select expense date
  void selectDate(BuildContext context) async {
    Helper.hideKeyboard;

    DateTime firstDate = DateTime.parse(DateFormat("yyy-MM-dd").format(DateTime.now()));
    DateTime lastDate = firstDate.add(AppConfig.maxTaskDuration);
    if(selectedDate.isBefore(firstDate) || selectedDate.isAfter(lastDate)) return;

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate = pickedDate;
      setDateInput();
    }
    update();
  }

  ///   [setDateInput] method is used to set the selected date in text input field
  void setDateInput() {
    dueDateInput.text = Helper.formatDate(selectedDate);
  }

  ///   [setDateInput] method is used to set the selected date in text input field
  void setTaskStatusInput() {
    taskStatusInput.text = taskStatus ?? false ? "Competed" : "Pending";
  }

  Future<void> selectTaskStatus() async {
    Helper.hideKeyboard;
    taskStatus = await getBottomSheet(
      isMobile: true,
      child: TaskStatusBottomSheet(selectedStatus: taskStatus)
    );
    setTaskStatusInput();
  }

  ///   [validateForm] method is used to validate form and proceed further to save record
  void validateForm() {
    Helper.hideKeyboard;
    if(Helper.validateForm(formKey)) {
      saveTask();
    }
  }

  ///   [saveTask] method is used to save task data on server. This
  ///   method is used in both adding and editing case
  Future<void> saveTask() async {
    try {
      Map<String, dynamic> params = {
        "user_id": 1,
        "title": titleInput.text,
        "description": descriptionInput.text,
        "priority": priority?.toInt() ?? 0,
        "status": taskStatus,
        "deadLine": DateFormat("yyy-MM-dd").format(selectedDate),
      };
      ApiResponse response;
      if(formType == TaskFormType.edit) {
        params.addEntries({
          "id" : task?.id,
          "updatedAt" : DateFormat("yyy-MM-dd").format(DateTime.now())
        }.entries);
        response = await TasksRepository().updateTask(params: params, id: task?.id);
      } else {
        params.addEntries({
          "createdAt" : DateFormat("yyy-MM-dd").format(DateTime.now()),
          "updatedAt" : DateFormat("yyy-MM-dd").format(DateTime.now())
        }.entries);
        response = await TasksRepository().addTask(params: params);
      }

      if(!(response.status ?? false)) {

      } else {
        task = response.data;
      }
      Get.back(result: task);
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

}