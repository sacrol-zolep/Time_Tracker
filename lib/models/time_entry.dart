// Clase fecha de registro

class TimeEntry {
  final DateTime id;
  final String projectId;
  final String taskId;
  final String note;
  final int totalTime;

  TimeEntry({
    required this.id,
    required this.projectId,
    required this.taskId,
    this.note = '',
    this.totalTime = 1,
  });

  factory TimeEntry.fromJson(Map<String, dynamic> json) {
    return TimeEntry(
      id: json['id'],
      projectId: json ['projectId'],
      taskId: json['taskId'],
      note: json['note'] ?? '',
      totalTime: json['totalTime'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'projectId': projectId,
      'taskId': taskId,
      'note': note,
      'totalTime': totalTime,
    };
  }
}