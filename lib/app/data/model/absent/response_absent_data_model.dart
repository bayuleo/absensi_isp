import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ResponseAbsentDataModel {

  const ResponseAbsentDataModel({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    required this.address,
    required this.position,
    required this.otpCode,
    required this.path,
    required this.filename,
    required this.mimetype,
    required this.createdAt,
    required this.updatedAt,
    required this.absent,
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
  final String path;
  final String filename;
  final String mimetype;
  final String createdAt;
  final String updatedAt;
  final List<ResponseAbsentDataAbsentModel> absent;

  factory ResponseAbsentDataModel.fromJson(Map<String,dynamic> json) => ResponseAbsentDataModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode'].toString(),
    path: json['path'].toString(),
    filename: json['filename'].toString(),
    mimetype: json['mimetype'].toString(),
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
    absent: (json['absent'] as List? ?? []).map((e) => ResponseAbsentDataAbsentModel.fromJson(e as Map<String, dynamic>)).toList()
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
    'updated_at': updatedAt,
    'absent': absent.map((e) => e.toJson()).toList()
  };

  ResponseAbsentDataModel clone() => ResponseAbsentDataModel(
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
    updatedAt: updatedAt,
    absent: absent.map((e) => e.clone()).toList()
  );


  ResponseAbsentDataModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? otpCode,
    String? path,
    String? filename,
    String? mimetype,
    String? createdAt,
    String? updatedAt,
    List<ResponseAbsentDataAbsentModel>? absent
  }) => ResponseAbsentDataModel(
    id: id ?? this.id,
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: address ?? this.address,
    position: position ?? this.position,
    otpCode: otpCode ?? this.otpCode,
    path: path ?? this.path,
    filename: filename ?? this.filename,
    mimetype: mimetype ?? this.mimetype,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    absent: absent ?? this.absent,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseAbsentDataModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && path == other.path && filename == other.filename && mimetype == other.mimetype && createdAt == other.createdAt && updatedAt == other.updatedAt && absent == other.absent;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ absent.hashCode;
}
