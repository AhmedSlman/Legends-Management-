class TasksModel {
  List<TasksData>? data;

  TasksModel({this.data});

  TasksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TasksData>[];
      json['data'].forEach((v) {
        data!.add(TasksData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TasksData {
  int? id;
  String? name;
  int? employeeId;
  String? employeeName;
  String status; // Make this non-nullable
  String? description;

  // Constructor with a default value for status
  TasksData({
    this.id,
    this.name,
    this.employeeId,
    this.employeeName,
    String? status,
    this.description,
  }) : status = status ?? 'pending'; // Default value

  // JSON deserialization constructor
  TasksData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        employeeId = json['employee_id'],
        employeeName = json['employee_name'],
        // Set status to 'pending' if it's null
        status = (json['status'] == null ||
                (json['status'] is String && json['status'].isEmpty))
            ? 'pending'
            : json['status'] as String, // Cast to String to avoid type issues
        description = json['description'];

  // JSON serialization method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['employee_id'] = employeeId;
    data['employee_name'] = employeeName;
    data['status'] = status; // Will never be null due to default value
    data['description'] = description;
    return data;
  }
}
