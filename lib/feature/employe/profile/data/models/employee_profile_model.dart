class EmployeeProfileModel {
  String? message;
  Profile? profile;

  EmployeeProfileModel({this.message, this.profile});

  EmployeeProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    profile =
        json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
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
  String? image;
  String? rating;
  Level? level;
  Level? department;

  Profile(
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
      this.rating,
      this.level,
      this.department});

  Profile.fromJson(Map<String, dynamic> json) {
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
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
    department =
        json['department'] != null ? Level.fromJson(json['department']) : null;
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
    if (level != null) {
      data['level'] = level!.toJson();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? name;
  Null createdAt;
  Null updatedAt;

  Level({this.id, this.name, this.createdAt, this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
