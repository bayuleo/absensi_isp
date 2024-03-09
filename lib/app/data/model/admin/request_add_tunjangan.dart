import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class RequestAddTunjangan {

  const RequestAddTunjangan({
    required this.name,
    required this.amount,
    required this.idUsers,
  });

  final String name;
  final String amount;
  final int idUsers;

  factory RequestAddTunjangan.fromJson(Map<String,dynamic> json) => RequestAddTunjangan(
    name: json['name'].toString(),
    amount: json['amount'].toString(),
    idUsers: json['id_users'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'amount': amount,
    'id_users': idUsers
  };

  RequestAddTunjangan clone() => RequestAddTunjangan(
    name: name,
    amount: amount,
    idUsers: idUsers
  );


  RequestAddTunjangan copyWith({
    String? name,
    String? amount,
    int? idUsers
  }) => RequestAddTunjangan(
    name: name ?? this.name,
    amount: amount ?? this.amount,
    idUsers: idUsers ?? this.idUsers,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestAddTunjangan && name == other.name && amount == other.amount && idUsers == other.idUsers;

  @override
  int get hashCode => name.hashCode ^ amount.hashCode ^ idUsers.hashCode;
}
