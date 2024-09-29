class LoginModel {
  String? message;
  User? user;
  String? employeeCode;
  String? token;

  LoginModel({this.message, this.user, this.employeeCode, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    employeeCode = json['employee_code'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['employee_code'] = employeeCode;
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? role;
  String? phone;
  int? bankAccount;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null departmentId;
  Null levelId;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
