import 'dart:convert';

import 'package:asiagolf_app/app/utils/global.dart';
import 'package:crypto/crypto.dart' as cr;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension RInt on int {
  double get w {
    final width = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.width;

    final precentage = width / screen;

    return precentage * screen;
  }

  double get h {
    final height = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.height;

    final precentage = height / screen;

    return precentage * screen;
  }

  double get r {
    final radius = this;
    final size = MediaQuery.of(globalNavKey.currentContext!).size;
    final screen = (size.height + size.width) / 2;

    final precentage = radius / screen;

    return precentage * screen;
  }
}

extension RDouble on double {
  double get w {
    final width = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.width;

    final precentage = width / screen;

    return precentage * screen;
  }

  double get h {
    final height = this;
    final screen = MediaQuery.of(globalNavKey.currentContext!).size.height;

    final precentage = height / screen;

    return precentage * screen;
  }

  double get r {
    final radius = this;
    final size = MediaQuery.of(globalNavKey.currentContext!).size;
    final screen = (size.height + size.width) / 2;

    final precentage = radius / screen;

    return precentage * screen;
  }
}

extension Crypto on String {
  String get encrypt => cr.md5.convert(utf8.encode(this)).toString();
}

extension Currency on int {
  String get convertIntToCurrency {
    final currency =
        NumberFormat.currency(locale: 'ID', symbol: 'Rp ', decimalDigits: 0);
    return currency.format(this);
  }
}

extension TextFormat on String {
  String get toCamelCase {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get currencyToPlainText {
    return replaceAll('Rp', '').replaceAll('.', '').replaceAll(' ', '');
  }

  String get convertStringToCurrency {
    var value = int.tryParse(this) ?? 0;
    final currency =
        NumberFormat.currency(locale: 'ID', symbol: 'Rp ', decimalDigits: 0);
    return currency.format(value);
  }
}

extension TextFormatNullAble on String? {}
