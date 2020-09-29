import 'package:meta/meta.dart';
import 'package:seniorcare/api/misalud_api.dart';

class User{
  final String id, username, email, avatar;
  final DateTime createdAt, updatedAt;

  User({
    @required this.id, 
    @required this.username, 
    @required this.email, 
    @required this.createdAt, 
    @required this.updatedAt,
    this.avatar
  });

  setAvatar(String url){
    return User(
      id: this.id,
      email: this.email,
      username: this.username,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
      avatar: url
    );
  }

  static User fromJson(Map<String, dynamic> json){
    String avatar;
    if(json['avatar'] != null){
      avatar = baseUrl + json['avatar'];
    }
    return User(
      id: json['_id'], 
      username: json['username'], 
      email: json['email'], 
      avatar: avatar,
      createdAt: DateTime.parse(json['createdAt']), 
      updatedAt: DateTime.parse(json['updatedAt'])
    );
  }

}