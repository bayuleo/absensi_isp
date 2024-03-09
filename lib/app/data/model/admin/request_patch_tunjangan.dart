import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class RequestPatchTunjangan {

  const RequestPatchTunjangan({
    required this.amount,
  });

  final String amount;

  factory RequestPatchTunjangan.fromJson(Map<String,dynamic> json) => RequestPatchTunjangan(
    amount: json['amount'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'amount': amount
  };

  RequestPatchTunjangan clone() => RequestPatchTunjangan(
    amount: amount
  );


  RequestPatchTunjangan copyWith({
    String? amount
  }) => RequestPatchTunjangan(
    amount: amount ?? this.amount,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RequestPatchTunjangan && amount == other.amount;

  @override
  int get hashCode => amount.hashCode;
}
