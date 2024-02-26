import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseIjinByIdDataModel {

  const ResponseIjinByIdDataModel({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    required this.address,
    required this.position,
    required this.otpCode,
    required this.filename,
    required this.isDelete,
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
  final String filename;
  final bool isDelete;
  final String createdAt;
  final String updatedAt;
  final List<ResponseIjinByIdDataIjinModel> ijin;

  factory ResponseIjinByIdDataModel.fromJson(Map<String,dynamic> json) => ResponseIjinByIdDataModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode'].toString(),
    filename: json['filename'].toString(),
    isDelete: json['is_delete'] as bool,
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
    ijin: (json['ijin'] as List? ?? []).map((e) => ResponseIjinByIdDataIjinModel.fromJson(e as Map<String, dynamic>)).toList()
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
    'filename': filename,
    'is_delete': isDelete,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'ijin': ijin.map((e) => e.toJson()).toList()
  };

  ResponseIjinByIdDataModel clone() => ResponseIjinByIdDataModel(
    id: id,
    name: name,
    password: password,
    phone: phone,
    nik: nik,
    email: email,
    address: address,
    position: position,
    otpCode: otpCode,
    filename: filename,
    isDelete: isDelete,
    createdAt: createdAt,
    updatedAt: updatedAt,
    ijin: ijin.map((e) => e.clone()).toList()
  );


  ResponseIjinByIdDataModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? otpCode,
    String? filename,
    bool? isDelete,
    String? createdAt,
    String? updatedAt,
    List<ResponseIjinByIdDataIjinModel>? ijin
  }) => ResponseIjinByIdDataModel(
    id: id ?? this.id,
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: address ?? this.address,
    position: position ?? this.position,
    otpCode: otpCode ?? this.otpCode,
    filename: filename ?? this.filename,
    isDelete: isDelete ?? this.isDelete,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    ijin: ijin ?? this.ijin,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseIjinByIdDataModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && filename == other.filename && isDelete == other.isDelete && createdAt == other.createdAt && updatedAt == other.updatedAt && ijin == other.ijin;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ filename.hashCode ^ isDelete.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ ijin.hashCode;
}
