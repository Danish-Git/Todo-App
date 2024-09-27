class TaskModel {


  String? title;
  String? description;
  int? priority;
  bool? status;
  String? deadLine;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? id;

  TaskModel({
    this.title,
    this.description,
    this.priority,
    this.status,
    this.deadLine,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.id,
  });

  TaskModel.fromJson(Map<String, dynamic> json) {
    title = json['title']?.toString();
    description = json['description']?.toString();
    priority = int.tryParse(json['priority']?.toString() ?? '');
    status = json['status'];
    deadLine = json['deadLine']?.toString() ?? '';
    createdAt = json['createdAt']?.toString() ?? '';
    updatedAt = json['updatedAt']?.toString() ?? '';
    userId = int.tryParse(json['user_id']?.toString() ?? '');
    id = json['id']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['priority'] = priority;
    data['status'] = status;
    data['deadLine'] = deadLine;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['user_id'] = userId;
    data['id'] = id;
    return data;
  }
}