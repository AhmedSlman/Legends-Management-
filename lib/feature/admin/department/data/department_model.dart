class DepartmentModel {
  String? message;
  String? department;
  List<Employees>? employees;

  DepartmentModel({this.message, this.department, this.employees});

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    department = json['department'];
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['department'] = department;
    if (employees != null) {
      data['employees'] = employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int? id;
  String? name;
  String? email;
  String? role;
  String? phone;
  int? bankAccount;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  int? levelId;

  Employees(
      {this.id,
      this.name,
      this.email,
      this.role,
      this.phone,
      this.bankAccount,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.departmentId,
      this.levelId});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    bankAccount = json['bank_account'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentId = json['department_id'];
    levelId = json['level_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['phone'] = phone;
    data['bank_account'] = bankAccount;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['department_id'] = departmentId;
    data['level_id'] = levelId;
    return data;
  }
}
