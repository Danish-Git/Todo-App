import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/routes.dart';
import '../../../data/models/data_models/response.dart';
import '../../../data/models/data_models/task.dart';
import '../../../data/repositories/tasks.dart';

class HomeViewController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;

  final List<Tab> homeViewTabs = const <Tab>[
    Tab(text: "All Tasks"),
    Tab(text: "Pending"),
    Tab(text: "Completed"),
  ];

  bool isLoading = false;
  String dayGreeting = "";
  String? errorMessage;

  List<TaskModel>? taskList;


  @override
  void onInit() {
    super.onInit();
    importantInitialisations();
    loadData();
  }

  void importantInitialisations() {
    tabController = TabController(length: homeViewTabs.length, vsync: this);
    tabController.addListener(() => update());
    getDayGreetings();
  }

  void getDayGreetings() {
    DateTime time = DateTime(0,0,0,DateTime.now().hour,DateTime.now().minute);
    if(time.isBefore(DateTime(0,0,0,11,59))) {
      dayGreeting = "Morning";
    } else if (time.isAfter(DateTime(0,0,0,12,00)) && time.isBefore(DateTime(0,0,0,14,59))) {
      dayGreeting = "Afternoon";
    } else if (time.isAfter(DateTime(0,0,0,15,00)) && time.isBefore(DateTime(0,0,0,17,59))) {
      dayGreeting = "Noon";
    } else if (time.isAfter(DateTime(0,0,0,18,00)) && time.isBefore(DateTime(0,0,0,21,59))) {
      dayGreeting = "Evening";
    } else if (time.isAfter(DateTime(0,0,0,22,00)) && time.isBefore(DateTime(0,0,0,23,59))) {
      dayGreeting = "Night";
    } else {
      dayGreeting = "Morning";
    }
    update();
  }


  Future<void> loadData() async {
    try {
      taskList = [];
      toggleIsLoading();
      ApiResponse response = await TasksRepository().getAllTasks();
      if(!(response.status ?? false)) {
        errorMessage = response.message;
      } else {
        taskList = response.data;
        if(taskList?.isEmpty ?? true) errorMessage = "Click on + button to add task";
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      toggleIsLoading();
    }
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    update();
  }

  void onRefreshData() => loadData();

  Future<void> navigateToTaskForm() async {
    var result = await Get.toNamed(Routes.taskForm);
    if(result is TaskModel) {
      onRefreshData();
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

}