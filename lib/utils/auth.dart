import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart' show required;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seniorcare/api/seniorcare_api.dart';
import 'package:seniorcare/pages/login_page.dart';

class Auth {
  Auth._internal();
  static Auth _instance = Auth._internal();
  static Auth get instance => _instance;

  final _storage = FlutterSecureStorage();
  final key = "SESSION";

  Completer _completer;

  Future<String> get accessToken async {
    if (_completer != null) {
      await _completer.future;
    }

    _completer = Completer();

    final Session session = await this.getSession();
    if (session != null) {
      final DateTime currentDate = DateTime.now();
      final DateTime createAt = session.createAt;
      final int expiresIn = session.expiresIn;

      final int diff = currentDate.difference(createAt).inSeconds;

      if (expiresIn - diff >= 60) {
        _complete();
        return session.token;
      } else {
        final Map<String, dynamic> data =
            await SeniorCareApi.instance.refresh(session.token);
        if (data != null) {
          await this.setSession(data);
          _complete();
          return data['token'];
        }
        _complete();
        return null;
      }
    }
    _complete();
    return null;
  }

  _complete() {
    if (this._completer != null && !this._completer.isCompleted) {
      this._completer.complete();
    }
  }

  Future<void> setSession(Map<String, dynamic> data) async {
    final Session session = Session(
      token: data['token'],
      expiresIn: data['expiresIn'],
      createAt: DateTime.now(),
    );

    final String value = jsonEncode(session.toJson());
    await this._storage.write(key: key, value: value);
  }

  Future<Session> getSession() async {
    final String value = await this._storage.read(key: key);
    if (value != null) {
      final Map<String, dynamic> json = jsonDecode(value);
      final session = Session.fromJson(json);
      return session;
    }
    return null;
  }

  Future<void> logOut(BuildContext context) async {
    await this._storage.deleteAll();
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (_) => false);
  }
}

class Session {
  final String token;
  final int expiresIn;
  final DateTime createAt;

  Session({@required this.token, this.expiresIn, this.createAt});

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
        token: json['token'],
        expiresIn: json['expiresIn'],
        createAt: DateTime.parse(json['createAt']));
  }

  Map<String, dynamic> toJson() {
    return {
      "token": this.token,
      "expiresIn": this.expiresIn,
      "createAt": this.createAt.toString()
    };
  }
}
