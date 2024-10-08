class RatingModel {
  String? message;
  Employee? employee;

  RatingModel({this.message, this.employee});

  RatingModel.fromJson(Map<String, dynamic> json) {
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
  Null verificationCode;
  String? verifiedAt;
  Null image;
  String? rating;

  Employee(
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
      this.levelId,
      this.verificationCode,
      this.verifiedAt,
      this.image,
      this.rating});

  Employee.fromJson(Map<String, dynamic> json) {
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
    verificationCode = json['verification_code'];
    verifiedAt = json['verified_at'];
    image = json['image'];
    rating = json['rating'];
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
    data['verification_code'] = verificationCode;
    data['verified_at'] = verifiedAt;
    data['image'] = image;
    data['rating'] = rating;
    return data;
  }
}
