import 'package:intl/intl.dart';

extension DateFromString on String {
  DateTime? toDate() => DateTime.parse(this);
}

extension DateFromSimpleString on String {
  DateTime? toDateFromSimpleString() => DateFormat('dd/MM/yyyy').parse(this);
}

extension DateToSimple on DateTime {
  String? toSimpleString([String? format]) =>
      DateFormat(format ?? 'dd MMM').format(this);
}
