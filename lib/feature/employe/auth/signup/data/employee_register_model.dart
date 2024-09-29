class EmployeeRegisterModel {
  String? message;
  Employee? employee;

  EmployeeRegisterModel({this.message, this.employee});

  EmployeeRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    employee =
        json['employee'] != null ? Employee.fromJson(json['employee']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (employee != null) {
      data['employee'] = employee!.toJson();
    }
    return data;
  }
}

class Employee {
  String? name;
  String? email;
  String? phone;
  String? bankAccount;
  int? departmentId;
  int? levelId;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  Employee(
      {this.name,
      this.email,
      this.phone,
      this.bankAccount,
      this.departmentId,
      this.levelId,
      this.role,
      this.updatedAt,
      this.createdAt,
      this.id});

  Employee.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bankAccount = json['bank_account'];
    departmentId = json['department_id'];
    levelId = json['level_id'];
    role = json['role'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['bank_account'] = bankAccount;
    data['department_id'] = departmentId;
    data['level_id'] = levelId;
    data['role'] = role;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
