class HomeTasksCount {
  int? allTasks;
  int? completedTasks;
  int? pendingTasks;

  HomeTasksCount(
      {this.allTasks, this.completedTasks, this.pendingTasks});

  HomeTasksCount.fromJson(Map<String, dynamic> json) {
    allTasks = json['All tasks'];
    completedTasks = json['completed tasks'];
    pendingTasks = json['pending tasks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['All tasks'] = allTasks;
    data['completed tasks'] = completedTasks;
    data['pending tasks'] = pendingTasks;
    return data;
  }
}
