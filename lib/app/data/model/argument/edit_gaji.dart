import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class EditGaji {

  const EditGaji({
    required this.userId,
    required this.isEditMode,
  });

  final int userId;
  final bool isEditMode;

  factory EditGaji.fromJson(Map<String,dynamic> json) => EditGaji(
    userId: json['userId'] as int,
    isEditMode: json['isEditMode'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'isEditMode': isEditMode
  };

  EditGaji clone() => EditGaji(
    userId: userId,
    isEditMode: isEditMode
  );


  EditGaji copyWith({
    int? userId,
    bool? isEditMode
  }) => EditGaji(
    userId: userId ?? this.userId,
    isEditMode: isEditMode ?? this.isEditMode,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is EditGaji && userId == other.userId && isEditMode == other.isEditMode;

  @override
  int get hashCode => userId.hashCode ^ isEditMode.hashCode;
}
