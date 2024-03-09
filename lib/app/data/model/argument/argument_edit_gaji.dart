import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import '../index.dart';

@immutable
class ArgumentEditGaji {

  const ArgumentEditGaji({
    required this.userId,
    this.tunjanganId,
    required this.isEditMode,
    required this.isShowDelete,
    required this.isGajiPokok,
    this.selectedLabel,
    this.selectedValue,
  });

  final int userId;
  final int? tunjanganId;
  final bool isEditMode;
  final bool isShowDelete;
  final bool isGajiPokok;
  final String? selectedLabel;
  final String? selectedValue;

  factory ArgumentEditGaji.fromJson(Map<String,dynamic> json) => ArgumentEditGaji(
    userId: json['userId'] as int,
    tunjanganId: json['tunjanganId'] != null ? json['tunjanganId'] as int : null,
    isEditMode: json['isEditMode'] as bool,
    isShowDelete: json['isShowDelete'] as bool,
    isGajiPokok: json['isGajiPokok'] as bool,
    selectedLabel: json['selectedLabel']?.toString(),
    selectedValue: json['selectedValue']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'tunjanganId': tunjanganId,
    'isEditMode': isEditMode,
    'isShowDelete': isShowDelete,
    'isGajiPokok': isGajiPokok,
    'selectedLabel': selectedLabel,
    'selectedValue': selectedValue
  };

  ArgumentEditGaji clone() => ArgumentEditGaji(
    userId: userId,
    tunjanganId: tunjanganId,
    isEditMode: isEditMode,
    isShowDelete: isShowDelete,
    isGajiPokok: isGajiPokok,
    selectedLabel: selectedLabel,
    selectedValue: selectedValue
  );


  ArgumentEditGaji copyWith({
    int? userId,
    Optional<int?>? tunjanganId,
    bool? isEditMode,
    bool? isShowDelete,
    bool? isGajiPokok,
    Optional<String?>? selectedLabel,
    Optional<String?>? selectedValue
  }) => ArgumentEditGaji(
    userId: userId ?? this.userId,
    tunjanganId: checkOptional(tunjanganId, () => this.tunjanganId),
    isEditMode: isEditMode ?? this.isEditMode,
    isShowDelete: isShowDelete ?? this.isShowDelete,
    isGajiPokok: isGajiPokok ?? this.isGajiPokok,
    selectedLabel: checkOptional(selectedLabel, () => this.selectedLabel),
    selectedValue: checkOptional(selectedValue, () => this.selectedValue),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ArgumentEditGaji && userId == other.userId && tunjanganId == other.tunjanganId && isEditMode == other.isEditMode && isShowDelete == other.isShowDelete && isGajiPokok == other.isGajiPokok && selectedLabel == other.selectedLabel && selectedValue == other.selectedValue;

  @override
  int get hashCode => userId.hashCode ^ tunjanganId.hashCode ^ isEditMode.hashCode ^ isShowDelete.hashCode ^ isGajiPokok.hashCode ^ selectedLabel.hashCode ^ selectedValue.hashCode;
}
