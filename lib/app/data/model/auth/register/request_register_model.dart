import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class RequestRegisterModel {

  const RequestRegisterModel({
    required this.name,
    required this.address,
    required this.phone,
    required this.gender,
    required this.email,
    required this.password,
  });

  final String name;
  final String address;
  final String phone;
  final String gender;
  final String email;
  final String password;

  factory RequestRegisterModel.fromJson(Map<String,dynamic> json) => RequestRegisterModel(
    name: json['name'].toString(),
    address: json['address'].toString(),
    phone: json['phone'].toString(),
    gender: json['gender'].toString(),
    email: json['email'].toString(),
    password: json['password'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'phone': phone,
    'gender': gender,
    'email': email,
    'password': password
  };

  RequestRegisterModel clone() => RequestRegisterModel(
    name: name,
    address: address,
    phone: phone,
    gender: gender,
    email: email,
    password: password
  );


  RequestRegisterModel copyWith({
    String? name,
    String? address,
    String? phone,
    String? gender,
    String? email,
    String? password
  }) => RequestRegisterModel(
    name: name ?? this.name,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    gender: gender ?? this.gender,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestRegisterModel && name == other.name && address == other.address && phone == other.phone && gender == other.gender && email == other.email && password == other.password;

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ phone.hashCode ^ gender.hashCode ^ email.hashCode ^ password.hashCode;
}
