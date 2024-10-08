class LoginModel {
  String? message;
  User? user;
  String? employeeCode; // Ensure this matches the API if it exists
  String? token;

  LoginModel({this.message, this.user, this.employeeCode, this.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'] as String?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      employeeCode: json['employee_code'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
      'employee_code': employeeCode,
      'token': token,
    };
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? role;
  String? phone;
  int? bankAccount; // Adjust this based on your API response
  String? emailVerifiedAt; // Assuming it's a String, adjust as necessary
  String? createdAt;
  String? updatedAt;
  int? departmentId; // Changed to int?
  int? levelId; // Changed to int?

  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.bankAccount,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.departmentId,
    this.levelId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
      phone: json['phone'] as String?,
      bankAccount: json['bank_account'] as int?,
      emailVerifiedAt:
          json['email_verified_at'] as String?, // Assuming it's a String
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      departmentId: json['department_id'] as int?, // Changed to int?
      levelId: json['level_id'] as int?, // Changed to int?
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'bank_account': bankAccount,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'department_id': departmentId,
      'level_id': levelId,
    };
  }
}
