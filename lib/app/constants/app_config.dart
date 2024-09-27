
class AppConfig {
  static const String appName = "ToDo";
  static const int transitionDuration = 150;
  static const String emailReg = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const Duration maxTaskDuration = Duration(days: 7);

  static const String baseUrl = "https://66f43e2477b5e8897098e2c0.mockapi.io/api/v1";
  static const String tasksUrl = "$baseUrl/task";
  static String singleTasksUrl(String id) => "$baseUrl/task/$id";
}