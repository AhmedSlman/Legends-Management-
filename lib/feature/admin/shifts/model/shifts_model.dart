class ShiftsModel {
  List<ShiftsData>? data;

  ShiftsModel({this.data});

  ShiftsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShiftsData>[];
      json['data'].forEach((v) {
        data!.add(ShiftsData.fromJson(v));
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

class ShiftsData {
  int? id;
  int? employeeId;
  String? employeeName;
  String? from;
  String? to;
  String? day;
  String? status;

  ShiftsData(
      {this.id,
      this.employeeId,
      this.employeeName,
      this.from,
      this.to,
      this.day,
      this.status});

  ShiftsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    employeeName = json['employee_name'];
    from = json['from'];
    to = json['to'];
    day = json['day'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employee_id'] = employeeId;
    data['employee_name'] = employeeName;
    data['from'] = from;
    data['to'] = to;
    data['day'] = day;
    data['status'] = status;
    return data;
  }
}
