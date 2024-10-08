class AdminRegisterModel {
  String? message;
  Manager? manager;
  String? employeeCode;

  AdminRegisterModel({this.message, this.manager, this.employeeCode});

  AdminRegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    manager =
        json['manager'] != null ? Manager.fromJson(json['manager']) : null;
    employeeCode = json['employee_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (manager != null) {
      data['manager'] = manager!.toJson();
    }
    data['employee_code'] = employeeCode;
    return data;
  }
}

class Manager {
  String? name;
  String? email;
  String? phone;
  String? bankAccount;
  Null departmentId;
  Null levelId;
  String? role;
  String? updatedAt;
  String? createdAt;
  int? id;

  Manager(
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

  Manager.fromJson(Map<String, dynamic> json) {
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
