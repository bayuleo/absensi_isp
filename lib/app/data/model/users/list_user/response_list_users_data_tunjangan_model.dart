import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../../index.dart';

@immutable
class ResponseListUsersDataTunjanganModel {

  const ResponseListUsersDataTunjanganModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final int amount;
  final String createdAt;
  final String updatedAt;

  factory ResponseListUsersDataTunjanganModel.fromJson(Map<String,dynamic> json) => ResponseListUsersDataTunjanganModel(
    id: json['id'] as int,
    name: json['name'].toString(),
    amount: json['amount'] as int,
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'amount': amount,
    'created_at': createdAt,
    'updated_at': updatedAt
  };

  ResponseListUsersDataTunjanganModel clone() => ResponseListUsersDataTunjanganModel(
    id: id,
    name: name,
    amount: amount,
    createdAt: createdAt,
    updatedAt: updatedAt
  );


  ResponseListUsersDataTunjanganModel copyWith({
    int? id,
    String? name,
    int? amount,
    String? createdAt,
    String? updatedAt
  }) => ResponseListUsersDataTunjanganModel(
    id: id ?? this.id,
    name: name ?? this.name,
    amount: amount ?? this.amount,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseListUsersDataTunjanganModel && id == other.id && name == other.name && amount == other.amount && createdAt == other.createdAt && updatedAt == other.updatedAt;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ amount.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
