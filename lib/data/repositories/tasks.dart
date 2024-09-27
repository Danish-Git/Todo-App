import 'package:esferasoft/data/models/data_models/task.dart';

import '../../app/constants/app_config.dart';
import '../models/data_models/response.dart';
import 'api.dart';

class TasksRepository {

  Future<ApiResponse> getAllTasks() async {
    return ApiRequests().get(url: AppConfig.tasksUrl).then((response) {
          if(!(response.status ?? false)) {
            return response;
          } else {
            List<TaskModel> taskList = [];
            for (var element in (response.data as List)) {
              if(element["user_id"] == 1) {
                taskList.add(TaskModel.fromJson(element));
              }
            }
            taskList = taskList.reversed.toList();
            return ApiResponse(status: true, data: taskList);
          }
      })
        .catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> updateTask({required Map<String, dynamic> params, String? id}) async {
    return ApiRequests().put(url: AppConfig.singleTasksUrl(id ?? ""), params: params).then((response) {
      if(!(response.status ?? false)) {
        return response;
      } else {
        return ApiResponse(status: true, data: TaskModel.fromJson(response.data));
      }
    })
        .catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  addTask({required Map<String, dynamic> params}) {
    return ApiRequests().post(url: AppConfig.tasksUrl, params: params).then((response) {
      if(!(response.status ?? false)) {
        return response;
      } else {
        return ApiResponse(status: true, data: TaskModel.fromJson(response.data));
      }
    })
        .catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }

  Future<ApiResponse> deleteTask({String? id})  async {
    return ApiRequests().delete(url: AppConfig.singleTasksUrl(id ?? "")).then((response) {
      if(!(response.status ?? false)) {
        return response;
      } else {
        return ApiResponse(status: true, data: TaskModel.fromJson(response.data));
      }
    })
        .catchError((error) => ApiResponse(status: false, message: error.toString()))
        .onError((error, stackTrace) => ApiResponse(status: false, message: error.toString()));
  }
}