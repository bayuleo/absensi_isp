import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseListUsersDataModel {

  const ResponseListUsersDataModel({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.nik,
    required this.email,
    required this.address,
    required this.position,
    required this.otpCode,
    this.gaji,
    required this.filename,
    required this.tunjangan,
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
  final int? gaji;
  final String filename;
  final List<ResponseListUsersDataTunjanganModel> tunjangan;
  final String createdAt;
  final String updatedAt;

  factory ResponseListUsersDataModel.fromJson(Map<String,dynamic> json) => ResponseListUsersDataModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    password: json['password'].toString(),
    phone: json['phone'].toString(),
    nik: json['nik'].toString(),
    email: json['email'].toString(),
    address: json['address'].toString(),
    position: json['position'].toString(),
    otpCode: json['otpCode'].toString(),
    gaji: json['gaji'] != null ? json['gaji'] as int : null,
    filename: json['filename'].toString(),
    tunjangan: (json['tunjangan'] as List? ?? []).map((e) => ResponseListUsersDataTunjanganModel.fromJson(e as Map<String, dynamic>)).toList(),
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
    'gaji': gaji,
    'filename': filename,
    'tunjangan': tunjangan.map((e) => e.toJson()).toList(),
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseListUsersDataModel clone() => ResponseListUsersDataModel(
    id: id,
    name: name,
    password: password,
    phone: phone,
    nik: nik,
    email: email,
    address: address,
    position: position,
    otpCode: otpCode,
    gaji: gaji,
    filename: filename,
    tunjangan: tunjangan.map((e) => e.clone()).toList(),
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseListUsersDataModel copyWith({
    int? id,
    String? name,
    String? password,
    String? phone,
    String? nik,
    String? email,
    String? address,
    String? position,
    String? otpCode,
    Optional<int?>? gaji,
    String? filename,
    List<ResponseListUsersDataTunjanganModel>? tunjangan,
    String? createdAt,
    String? updatedAt
  }) => ResponseListUsersDataModel(
    id: id ?? this.id,
    name: name ?? this.name,
    password: password ?? this.password,
    phone: phone ?? this.phone,
    nik: nik ?? this.nik,
    email: email ?? this.email,
    address: address ?? this.address,
    position: position ?? this.position,
    otpCode: otpCode ?? this.otpCode,
    gaji: checkOptional(gaji, () => this.gaji),
    filename: filename ?? this.filename,
    tunjangan: tunjangan ?? this.tunjangan,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListUsersDataModel && id == other.id && name == other.name && password == other.password && phone == other.phone && nik == other.nik && email == other.email && address == other.address && position == other.position && otpCode == other.otpCode && gaji == other.gaji && filename == other.filename && tunjangan == other.tunjangan && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ password.hashCode ^ phone.hashCode ^ nik.hashCode ^ email.hashCode ^ address.hashCode ^ position.hashCode ^ otpCode.hashCode ^ gaji.hashCode ^ filename.hashCode ^ tunjangan.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
