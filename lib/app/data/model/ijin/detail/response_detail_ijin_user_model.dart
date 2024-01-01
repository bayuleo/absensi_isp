import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseDetailIjinUserModel {

  const ResponseDetailIjinUserModel({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    this.address,
    required this.position,
    this.otpCode,
    this.path,
    this.filename,
    this.mimetype,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String password;
  final String phone;
  final String nik;
  final String email;
  final String? address;
  final String position;
  final String? otpCode;
  final String? path;
  final String? filename;
  final String? mimetype;
  final String createdAt;
  final String updatedAt;

  factory ResponseDetailIjinUserModel.fromJson(Map<String,dynamic> json) => ResponseDetailIjinUserModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address']?.toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode']?.toString(),
    path: json['path']?.toString(),
    filename: json['filename']?.toString(),
    mimetype: json['mimetype']?.toString(),
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
    'path': path,
    'filename': filename,
    'mimetype': mimetype,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseDetailIjinUserModel clone() => ResponseDetailIjinUserModel(
    id: id,
    name: name,
    password: password,
    phone: phone,
    nik: nik,
    email: email,
    address: address,
    position: position,
    otpCode: otpCode,
    path: path,
    filename: filename,
    mimetype: mimetype,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseDetailIjinUserModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    Optional<String?>? address,
    String? position,
    Optional<String?>? otpCode,
    Optional<String?>? path,
    Optional<String?>? filename,
    Optional<String?>? mimetype,
    String? createdAt,
    String? updatedAt
  }) => ResponseDetailIjinUserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: checkOptional(address, () => this.address),
    position: position ?? this.position,
    otpCode: checkOptional(otpCode, () => this.otpCode),
    path: checkOptional(path, () => this.path),
    filename: checkOptional(filename, () => this.filename),
    mimetype: checkOptional(mimetype, () => this.mimetype),
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseDetailIjinUserModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && path == other.path && filename == other.filename && mimetype == other.mimetype && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
