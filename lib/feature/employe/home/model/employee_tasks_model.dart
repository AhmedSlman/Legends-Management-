class EmployeeTasksModel {
  List<EmployeeTasksData>? data;

  EmployeeTasksModel({this.data});

  EmployeeTasksModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EmployeeTasksData>[];
      json['data'].forEach((v) {
        data!.add(EmployeeTasksData.fromJson(v));
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

class EmployeeTasksData {
  int? id;
  String? name;
  int? employeeId;
  String? employeeName;
  String? status;
  String? description;

  EmployeeTasksData(
      {this.id,
      this.name,
      this.employeeId,
      this.employeeName,
      this.status,
      this.description});

  EmployeeTasksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    status = json['status'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['employee_id'] = employeeId;
    data['employee_name'] = employeeName;
    data['status'] = status;
    data['description'] = description;
    return data;
  }
}
