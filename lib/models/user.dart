import 'package:meta/meta.dart';
import 'package:seniorcare/api/seniorcare_api.dart';

class User {
  final String username, email, avatar;
  final DateTime date;
  final int id;

  User({
    @required this.id,
    @required this.username,
    @required this.email,
    this.avatar,
    @required this.date,
  });

  User setAvatar(String url) {
    return User(
      id: this.id,
      email: this.email,
      username: this.username,
      avatar: url,
      date: this.date,
    );
  }

  static User fromJson(Map<String, dynamic> json) {
    String avatar;
    if (json['avatar'] != null && json['avatar'] != '') {
      avatar = baseUrl + json['avatar'];
    }
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      avatar: avatar,
      date: DateTime.parse(json['date']),
    );
  }
}
