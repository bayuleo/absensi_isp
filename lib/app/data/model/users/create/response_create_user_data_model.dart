import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseCreateUserDataModel {

  const ResponseCreateUserDataModel({
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    required this.address,
    required this.position,
    required this.image,
    required this.path,
    required this.filename,
    required this.mimetype,
    required this.otpCode,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String name;
  final String password;
  final String phone;
  final String nik;
  final String email;
  final String address;
  final String position;
  final String image;
  final String path;
  final String filename;
  final String mimetype;
  final String otpCode;
  final int id;
  final String createdAt;
  final String updatedAt;

  factory ResponseCreateUserDataModel.fromJson(Map<String,dynamic> json) => ResponseCreateUserDataModel(
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    image: json['image'].toString(),
    path: json['path'].toString(),
    filename: json['filename'].toString(),
    mimetype: json['mimetype'].toString(),
    otpCode: json['otpCode'].toString(),
    id: json['id'] as int,
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'phone': phone,
    'nik': nik,
    'email': email,
    'address': address,
    'position': position,
    'image': image,
    'path': path,
    'filename': filename,
    'mimetype': mimetype,
    'otpCode': otpCode,
    'id': id,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseCreateUserDataModel clone() => ResponseCreateUserDataModel(
    name: name,
    password: password,
    phone: phone,
    nik: nik,
    email: email,
    address: address,
    position: position,
    image: image,
    path: path,
    filename: filename,
    mimetype: mimetype,
    otpCode: otpCode,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseCreateUserDataModel copyWith({
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? image,
    String? path,
    String? filename,
    String? mimetype,
    String? otpCode,
    int? id,
    String? createdAt,
    String? updatedAt
  }) => ResponseCreateUserDataModel(
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: address ?? this.address,
    position: position ?? this.position,
    image: image ?? this.image,
    path: path ?? this.path,
    filename: filename ?? this.filename,
    mimetype: mimetype ?? this.mimetype,
    otpCode: otpCode ?? this.otpCode,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseCreateUserDataModel && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && image == other.image && path == other.path && filename == other.filename && mimetype == other.mimetype && otpCode == other.otpCode && id == other.id && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ image.hashCode ^ path.hashCode ^ filename.hashCode ^ mimetype.hashCode ^ otpCode.hashCode ^ id.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
