import 'package:meta/meta.dart';

class Job {
  final int id;
  final String description;
  final String address;
  final String schedule;
  final DateTime startDate;
  final String days;
  final String payDertail;
  final String experience;
  final String lat;
  final String lng;
  final String state;
  Job({
    @required this.id,
    @required this.description,
    @required this.address,
    @required this.schedule,
    @required this.startDate,
    @required this.days,
    @required this.payDertail,
    @required this.experience,
    @required this.lat,
    @required this.lng,
    @required this.state,
  });

  static Job fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      description: json['description'],
      address: json['address'],
      schedule: json['schedule'],
      startDate: DateTime.parse(json['startDate']),
      days: json['days'],
      payDertail: json['payDertail'],
      experience: json['experience'],
      lat: json['lat'],
      lng: json['lng'],
      state: json['state'],
    );
  }
}
