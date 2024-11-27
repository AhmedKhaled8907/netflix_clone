class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json['time'] as String?,
        days: json['days'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'days': days,
      };
}
