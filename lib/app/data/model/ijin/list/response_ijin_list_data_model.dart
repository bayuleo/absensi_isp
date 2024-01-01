import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinListDataModel {

  const ResponseIjinListDataModel({
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
    required this.ijin,
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
  final dynamic path;
  final dynamic filename;
  final dynamic mimetype;
  final String createdAt;
  final String updatedAt;
  final List<ResponseIjinListIjinModel> ijin;

  factory ResponseIjinListDataModel.fromJson(Map<String,dynamic> json) => ResponseIjinListDataModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode'].toString(),
    path: json['path'] as dynamic,
    filename: json['filename'] as dynamic,
    mimetype: json['mimetype'] as dynamic,
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
    ijin: (json['ijin'] as List? ?? []).map((e) => ResponseIjinListIjinModel.fromJson(e as Map<String, dynamic>)).toList()
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
    'ijin': ijin.map((e) => e.toJson()).toList()
  };

  ResponseIjinListDataModel clone() => ResponseIjinListDataModel(
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
    ijin: ijin.map((e) => e.clone()).toList()
  );


  ResponseIjinListDataModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? otpCode,
    dynamic? path,
    dynamic? filename,
    dynamic? mimetype,
    String? createdAt,
    String? updatedAt,
    List<ResponseIjinListIjinModel>? ijin
  }) => ResponseIjinListDataModel(
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
    ijin: ijin ?? this.ijin,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinListDataModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && path == other.path && filename == other.filename && mimetype == other.mimetype && createdAt == other.createdAt && updatedAt == other.updatedAt && ijin == other.ijin;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ ijin.hashCode;
}
