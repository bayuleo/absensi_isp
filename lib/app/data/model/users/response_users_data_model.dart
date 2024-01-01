import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponseUsersDataModel {

  const ResponseUsersDataModel({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    required this.address,
    required this.position,
    required this.otpCode,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String password;
  final String phone;
  final String nik;
  final String email;
  final String address;
  final String position;
  final String otpCode;
  final String createdAt;
  final String updatedAt;

  factory ResponseUsersDataModel.fromJson(Map<String,dynamic> json) => ResponseUsersDataModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode'].toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'password': password,
    'phone': phone,
    'nik': nik,
    'email': email,
    'address': address,
    'position': position,
    'otpCode': otpCode,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseUsersDataModel clone() => ResponseUsersDataModel(
    id: id,
    name: name,
    password: password,
    phone: phone,
    nik: nik,
    email: email,
    address: address,
    position: position,
    otpCode: otpCode,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseUsersDataModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? otpCode,
    String? createdAt,
    String? updatedAt
  }) => ResponseUsersDataModel(
    id: id ?? this.id,
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: address ?? this.address,
    position: position ?? this.position,
    otpCode: otpCode ?? this.otpCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseUsersDataModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
