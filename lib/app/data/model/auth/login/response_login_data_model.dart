import 'package:asiagolf_app/app/domain/entities/login_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseLoginDataModel extends LoginEntity {

  ResponseLoginDataModel.fromJson(Map<String,dynamic> json) : super(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    email: json['email'].toString(),
    phone: json['phone'].toString(),
    gender: json['gender'].toString(),
    birthDate: json['birth_date'].toString(),
    token: json['token'].toString(),
    refreshToken: json['refresh_token'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'email': email,
    'phone': phone,
    'gender': gender,
    'birth_date': birthDate,
    'token': token,
    'refresh_token': refreshToken
  };

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseLoginDataModel && id == other.id && nama == other.nama && email == other.email && phone == other.phone && gender == other.gender && birthDate == other.birthDate && token == other.token && refreshToken == other.refreshToken;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ email.hashCode ^ phone.hashCode ^ gender.hashCode ^ birthDate.hashCode ^ token.hashCode ^ refreshToken.hashCode;
}